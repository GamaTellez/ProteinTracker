//
//  AddEntryMenu.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/16/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

struct AddEntryMenuView : View {
    @Binding var manualEntryViewShowing : Bool
    
    @Binding var addEntryMenuViewShowing : Bool
    
    @Binding var alertShowing : Bool
    
    private var dayAvailable : Bool
    
    init(manualEntryViewShowing: Binding<Bool>, entryMenuViewShowing: Binding<Bool>, alertShowing: Binding<Bool>, dayAvailable: Bool) {
        self._manualEntryViewShowing = manualEntryViewShowing
        self._addEntryMenuViewShowing = entryMenuViewShowing
        self._alertShowing = alertShowing
        self.dayAvailable = dayAvailable
    }
    
    var body : some View {
        HStack {
            Spacer()
            
            VStack {
                
                Spacer()
                
                HStack {
                    Text("Search entry")
                        .foregroundColor(Color.foreGroundColor)
                        .font(Font.custom("StringHelveticaNeue-CondensedBold", size: 15))
                    Button(action: { /*feature coming soon*/ }) {
                        Image("searchEntry")
                            .renderingMode(.template)
                            .foregroundColor(.foreGroundColor)
                    }
                    .frame(width: 40, height: 40, alignment: .center)
                    .mask(Circle())
                    .foregroundColor(Color.foreGroundColor)
                    .overlay(Circle().stroke(Color.foreGroundColor, lineWidth: 0.5))
                }
                
                Spacer()
                
                HStack {
                    Text("Manual entry")
                        .foregroundColor(Color.foreGroundColor)
                        .font(Font.custom("StringHelveticaNeue-CondensedBold", size: 15))
                    Button(action: {
                        withAnimation {
                            if self.dayAvailable {
                                self.manualEntryViewShowing.toggle()
                                self.addEntryMenuViewShowing.toggle()
                            } else {
                                self.alertShowing.toggle()
                                self.addEntryMenuViewShowing.toggle()
                            }
                        }
                    }) {
                        Image("createEntry")
                            .renderingMode(.template)
                            .foregroundColor(.foreGroundColor)
                    }
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
        }.transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
    }
}

