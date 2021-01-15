//
//  BarMenuView.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 5/5/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

struct BarMenuView : View {

    @Binding var settingsViewPresented : Bool
    
    @Binding var analyticsViewPresented : Bool
    
    var dayDate : Date?
    
    let dayFunction : () -> Void
    
    var body : some View {
        HStack {
            BarButton(imageName: "settings", function: {
                self.settingsViewPresented.toggle()
                
            }, side: .leading, paddingSize: 10)
            .sheet(isPresented: $settingsViewPresented) { SettingsView() }
            Spacer()
            Button(action: {
                    self.dayFunction()
                }, label: {
                    DayText(text: Date.formattedDate(from: self.dayDate) ?? "Start a new day")
                })
            Spacer()
            BarButton(imageName: "analytics", function: { self.analyticsViewPresented.toggle()
            }, side: .trailing, paddingSize: 10)
        }
        .frame(minWidth: nil, idealWidth: nil, maxWidth: .infinity, minHeight: 70, idealHeight: nil, maxHeight: 70, alignment: .leading)
        .background(Color.black)
        .padding(.top, 43)
    }
}
