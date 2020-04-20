//
//  AddEntryMenu.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/16/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

struct AddEntryMenuView : View {
    var body : some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                HStack {
                    Text("Search entry")
                        .foregroundColor(Color.white)
                        .font(Font.custom("StringHelveticaNeue-CondensedBold", size: 15))
                    
                    
                    Button(action: {  }) {
                        Image("searchEntry")
                    }
                    .frame(width: 40, height: 40, alignment: .center)
                    .mask(Circle())
                    .foregroundColor(Color.white)
                    .overlay(Circle().stroke(Color.white, lineWidth: 0.5))
                }
                Spacer()
                
                HStack {
                    Text("Create entry")
                        .foregroundColor(Color.white)
                        .font(Font.custom("StringHelveticaNeue-CondensedBold", size: 15))
                    
                    Button(action: { }) {
                        Image("createEntry")
                    }
                    .frame(width: 40, height: 40, alignment: .center)
                    .mask(Circle())
                    .foregroundColor(Color.white)
                    .overlay(Circle().stroke(Color.white, lineWidth: 0.5))
                    .padding(.top, 5)
                }
                Spacer()
            }
            .frame(minWidth: 190, idealWidth: nil, maxWidth: 190, minHeight: 70, idealHeight: nil, maxHeight: 70, alignment: .trailing)
            Spacer()
        }
        .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            AddEntryMenuView()
        }
    }
}
