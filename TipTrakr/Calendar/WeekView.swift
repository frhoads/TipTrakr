//
//  WeekView.swift
//  TipTrakr
//
//  Created by Fletcher Rhoads on 3/21/20.
//  Copyright © 2020 Fletcher Rhoads. All rights reserved.
//

import SwiftUI

struct WeekView: View {
    @ObservedObject var calendarModel: CalendarModel

    private var week: Week

    init(calendarModel: CalendarModel, week: Week) {
        self.calendarModel = calendarModel
        self.week = week
    }
        
    var body: some View {
        HStack {
            ForEach(0..<self.calendarModel.calendar.shortWeekdaySymbols.count) { index in
                DayView(day: self.week.days[index])
            }
        }
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView(calendarModel: CalendarModel(), week: CalendarModel().monthlyCalendar.weeks[0])
    }
}
