//
//  DayView.swift
//  TipTrakr
//
//  Created by Fletcher Rhoads on 3/21/20.
//  Copyright © 2020 Fletcher Rhoads. All rights reserved.
//

import SwiftUI

struct DayView: View {
    private var day: Day
    
    init(day: Day) {
        self.day = day
    }
        
    var body: some View {
        Text(dateFrom(day: self.day))
                .frame(width: 44, height: 44, alignment: .center)
        }
    
    private func dateFrom(day: Day) -> String {
        guard let date = day.date else {
            return ""
        }
        
        let dayDate = Calendar.current.component(.day, from: date)
        
        return String(dayDate)
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(day: Day(date: Date()))
    }
}
