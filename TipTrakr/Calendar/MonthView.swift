//
//  MonthView.swift
//  TipTrakr
//
//  Created by Fletcher Rhoads on 3/21/20.
//  Copyright © 2020 Fletcher Rhoads. All rights reserved.
//

import SwiftUI

struct MonthView: View {
    @ObservedObject var calendarModel: CalendarModel
        
    init(calendarModel: CalendarModel) {
        self.calendarModel = calendarModel
    }
    
    var body: some View {
        VStack {
            ForEach(0..<calendarModel.totalWeeks) { index in
                WeekView(calendarModel: self.calendarModel, week: self.calendarModel.monthlyCalendar.weeks[index])
            }
        }
    }
}

struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthView(calendarModel: CalendarModel())
    }
}
