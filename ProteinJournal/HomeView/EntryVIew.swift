//
//  EntryVIew.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/16/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

struct ManualEntryView : View {
    @State var protein : String = "Protein"
    @State var calories : String = "Calories"
    @State var formFilled : Bool = false
    
    var body : some View {
        VStack {
            Text("New Entry")
                .foregroundColor(Color.white)
                .font(Font.custom("StringHelveticaNeue-CondensedBold", size: 20))
                .padding(10)
                
            
            TextField("proteinInput", text: $protein)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color.white)
                .multilineTextAlignment(.center)
                .frame(width: 280, height: 45, alignment: .center)
                .foregroundColor(Color.gray)
            
            TextField("caloriesInput", text: $calories)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .background(Color.white)
                .frame(width: 280, height: 45, alignment: .center)
                .foregroundColor(Color.gray)
            
            HStack {
                Spacer()
                Button(action: { }) {
                    Text("Cancel")
                }
                .foregroundColor(Color.white)
                Spacer()
                Button(action: { }) {
                    Text("Save")
                }
                .foregroundColor(Color.white)
                .disabled(!self.formFilled)
                Spacer()
            }
            Spacer()
        }
        .frame(width: 300, height: 200, alignment: .center)
        .background(Color.black)
        .opacity(0.8)
        .cornerRadius(20)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ManualEntryView()
        }
    }
}
