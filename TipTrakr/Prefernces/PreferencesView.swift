//
//  Preferences.swift
//  TipTrakr
//
//  Created by Fletcher Rhoads on 3/20/20.
//  Copyright © 2020 Fletcher Rhoads. All rights reserved.
//

import SwiftUI

struct PreferenceView: View {
    var body: some View {
        NavigationView {
            List {
                Text("About")
            }
            .navigationBarTitle("Preferences")
        }
    }
}

struct PreferenceView_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceView()
    }
}
