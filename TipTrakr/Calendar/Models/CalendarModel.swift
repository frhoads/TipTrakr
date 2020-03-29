//
//  CalendarModel.swift
//  TipTrakr
//
//  Created by Fletcher Rhoads on 3/22/20.
//  Copyright © 2020 Fletcher Rhoads. All rights reserved.
//

import Foundation

struct Month {
    var weeks: [Week]
}

struct Week {
    var days: [Day]
}

struct Day {
    var date: Date?
}

class CalendarModel: ObservableObject {
    @Published var calendarHeader: String
    @Published var monthlyCalendar: Month = Month(weeks: [])
    
    let calendar: Calendar = Calendar.current
    let totalWeeks = 6

    private var selectedDate: Date = Date()
    private var selectedCalendarMonth: Int
    private var selectedCalendarYear: Int
    private var indexForCurrentSelectedMonth: Int = 0
    
    private let currentDate: Date = Date()
    private let totalCalendarSlots = 42
    
    init() {
        self.selectedCalendarMonth = calendar.component(.month, from: currentDate)
        self.selectedCalendarYear = calendar.component(.year, from: currentDate)
        self.calendarHeader = DateFormatter().monthSymbols[self.selectedCalendarMonth - 1] + " " + String(self.selectedCalendarYear)
        guard let month = monthForDate(selectedDate: selectedDate) else { return }
        self.monthlyCalendar = month
    }
    
    func setSelectedIndex(at index: Int) {
        indexForCurrentSelectedMonth = index
        updateCalendar()
    }
    
    func changeSelectedIndex(by index: Int) {
        indexForCurrentSelectedMonth += index
        updateCalendar()
    }
    
    private func getIntValue(from date: Date) -> (month: Int, day: Int, year: Int) {
        return (
            calendar.component(.month, from: date),
            calendar.component(.day, from: date),
            calendar.component(.year, from: date)
        )
    }
    
    private func updateCalendarHeader(month: Int, year: Int) -> String {
       return DateFormatter().monthSymbols[month - 1] + " " + String(year)
    }
    
    private func updateCalendar() {
        selectedDate = calendar.date(byAdding: .month, value: indexForCurrentSelectedMonth, to: currentDate) ?? currentDate
        calendarHeader = updateCalendarHeader(month: getIntValue(from: selectedDate).month, year: getIntValue(from: selectedDate).year)
        selectedCalendarMonth = getIntValue(from: selectedDate).month
        selectedCalendarYear = getIntValue(from: selectedDate).year
        guard let month = monthForDate(selectedDate: selectedDate) else { return }
        monthlyCalendar = month
    }
    
    private func monthForDate(selectedDate: Date) -> Month? {
        guard let daysInMonth = calendar.range(of: .day, in: .month, for: selectedDate) else { return nil }
        
        guard let startOfMonth = calendar.date(from: DateComponents(calendar:calendar,
                                                                    year: getIntValue(from: selectedDate).year,
                                                                    month: getIntValue(from: selectedDate).month))
            else { return nil }
        
        let fillerDaysBeforeTheFirst = calendar.component(.weekday, from: startOfMonth) - 1
        let fillerDaysAfterLastDayOfMonth = totalCalendarSlots - daysInMonth.count
        var calendarDates: [Day] = []
        
        for _ in 0..<fillerDaysBeforeTheFirst {
            calendarDates.append(Day(date: nil))
        }
        
        for index in 0..<daysInMonth.count {
            let day = index + 1
            let dayDateComponents = DateComponents(calendar: calendar,
                                                   year: getIntValue(from: selectedDate).year,
                                                   month: getIntValue(from: selectedDate).month,
                                                   day: day)
            
            guard let dayDate = calendar.date(from: dayDateComponents) else { return nil }
            
            calendarDates.append(Day(date: dayDate))
        }
        
        for _ in 0..<fillerDaysAfterLastDayOfMonth {
            calendarDates.append(Day(date: nil))
        }
        
        var month = Month(weeks: [])
        for index in 0..<totalWeeks {
            let weekStart = index * 7
            let weekStop = index * 7 + 6
            let week = Week(days: Array(calendarDates[weekStart...weekStop]))
            month.weeks.append(week)
        }
        return month
    }
}
