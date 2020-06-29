//
//  AddEntryMenu.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/16/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

struct AddEntryMenu : View {
//    var manualEntryFunction : () -> Void
//    var searchEntryFuntion : () -> Void
    @Binding var manualEntryViewPresented : Bool
    @Binding var searchEntryViewPresented : Bool
    var body : some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                HStack {
                    Text("Search entry")
                        .foregroundColor(Color.foreGroundColor)
                        .font(Font.custom("StringHelveticaNeue-CondensedBold", size: 15))
                    Button(action: { self.searchEntryViewPresented.toggle() }) {
                        Image("searchEntry")
                    }
                    .frame(width: 40, height: 40, alignment: .center)
                    .mask(Circle())
                    .foregroundColor(Color.foreGroundColor)
                    .overlay(Circle().stroke(Color.foreGroundColor, lineWidth: 0.5))
                }
                Spacer()
                
                HStack {
                    Text("Create entry")
                        .foregroundColor(Color.foreGroundColor)
                        .font(Font.custom("StringHelveticaNeue-CondensedBold", size: 15))
                    
                    Button(action: { self.manualEntryViewPresented.toggle() }) {
                        Image("createEntry")
                    }
                    .sheet(isPresented: self.$manualEntryViewPresented) { ManualEntryView() }
                    .frame(width: 40, height: 40, alignment: .center)
                    .mask(Circle())
                    .foregroundColor(Color.foreGroundColor)
                    .overlay(Circle().stroke(Color.foreGroundColor, lineWidth: 0.5))
                    .padding(.top, 5)
                    
                }
                Spacer()
            }
            .frame(minWidth: 190, idealWidth: nil, maxWidth: 190, minHeight: 70, idealHeight: nil, maxHeight: 70, alignment: .trailing)
            Spacer()
        }
        .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
    }
}
