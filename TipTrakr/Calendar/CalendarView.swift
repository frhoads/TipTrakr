//
//  CalendarView.swift
//  TipTrakr
//
//  Created by Fletcher Rhoads on 3/21/20.
//  Copyright © 2020 Fletcher Rhoads. All rights reserved.
//

import SwiftUI

struct CalendarView: View {
    @ObservedObject var calendarModel: CalendarModel = CalendarModel()
        
    var body: some View {
        VStack {
            HStack {
                Button(
                    action: {
                        self.calendarModel.changeSelectedIndex(by: -1)
                },
                    label: { Text("Previous") }
                )
                    .padding()
                
                Spacer()
                
                Button(
                    action: {
                        self.calendarModel.setSelectedIndex(at: 0)
                },
                    label: { Text("Current Month") }
                )
                    .padding()
                
                Spacer()
                
                Button(
                    action: {
                        self.calendarModel.changeSelectedIndex(by: 1)
                },
                    label: { Text("Next") }
                )
                    .padding()
            }
            
            Text(calendarModel.calendarHeader)
                .font(.system(.largeTitle))
                .padding()
            
            CalendarDaysView()
                .padding(.horizontal)

            MonthView(calendarModel: self.calendarModel)
                .padding(.horizontal)
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
