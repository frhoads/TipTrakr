//
//  CalendarDaysView.swift
//  TipTrakr
//
//  Created by Fletcher Rhoads on 3/26/20.
//  Copyright © 2020 Fletcher Rhoads. All rights reserved.
//

import SwiftUI

struct CalendarDaysView: View {
    var body: some View {
        HStack {
            ForEach(0..<Calendar.current.shortWeekdaySymbols.count) { index in
                    Text(Calendar.current.shortWeekdaySymbols[index])
                        .frame(width: 44, alignment: .center)
            }
        }
    }
}

struct CalendarDaysView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarDaysView()
    }
}
