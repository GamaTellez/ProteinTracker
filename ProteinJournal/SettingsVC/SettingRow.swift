//
//  SettingRow.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/14/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

struct Setting: Identifiable {
    var id = UUID()
    var title: String
    var imageName: String
    var description: String
}

struct SettingRow: View {
    var setting: Setting
    
    var body: some View {
        HStack {
            Image(self.setting.imageName)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .foregroundColor(Color.white)
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text(self.setting.title)
                    .font(Font.custom("StringHelveticaNeue-CondensedBold", size: 15))
                    .multilineTextAlignment(.leading)
                    
                Text(self.setting.description)
                    .font(Font.custom("StringHelveticaNeue-CondensedBold", size: 10))
                    .padding(.leading, 10)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.gray)
            }
        }
    }
}
