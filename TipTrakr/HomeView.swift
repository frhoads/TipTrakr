//
//  HomeView.swift
//  TipTrakr
//
//  Created by Fletcher Rhoads on 3/20/20.
//  Copyright © 2020 Fletcher Rhoads. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            CalendarView()
              .tabItem {
                 Image(systemName: "calendar")
                 Text("Calendar")
               }
            
            PreferenceView()
              .tabItem {
                 Image(systemName: "gear")
                 Text("Preferences")
               }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
