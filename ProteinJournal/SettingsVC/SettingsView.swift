//
//  SettingsVC.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/14/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

struct SettingsView : View {
    
    let appSettings: [Setting] = [Setting(title: "New day", imageName: "newDay", description: "Start a new day"),
                                  Setting(title: "New Goal", imageName: "goal", description: "Set a new protein goal")]
    let localStorage: [Setting] = [Setting(title: "Clear Data", imageName: "clear", description: "Clear all data stored in Device")]
 
   var body : some View {
        VStack {
            HStack {
                Button(action: { self.dismissVC() }) {
                    Image("dismiss").foregroundColor(Color.white)
                }
                .foregroundColor(Color.foreGroundColor)
                .padding(.trailing, 5)
                
                Text("Settings")
                .foregroundColor(Color.foreGroundColor)
            }
            .frame(minWidth: nil, idealWidth: nil, maxWidth: .infinity, minHeight: 50, idealHeight: nil, maxHeight: 50, alignment: .leading)
            .background(Color.black)
            .padding(.top, 32)
            
            Spacer()
            
            List {
                Section(header:Text("Protein journal")) {
                    ForEach(self.appSettings) { appSetting in
                        SettingRow(setting: appSetting)
                        }
                }
                Section(header:Text("Local Storage")) {
                    ForEach(self.localStorage) { iCloudSetting in
                    SettingRow(setting: iCloudSetting)
                    }
                }
            }.listStyle(GroupedListStyle())
            
         
            
            
        }.frame(minWidth: nil, idealWidth: nil, maxWidth: .infinity, minHeight: nil, idealHeight: nil, maxHeight: .infinity, alignment: .center)
        .background(Color.backgroundGrey).edgesIgnoringSafeArea(.all)
    }

    private func dismissVC() {
        
    }
}

struct Content_Previews: PreviewProvider  {
    static var previews : some View {
        SettingsView()
    }
}
