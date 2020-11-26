//
//  ContentView.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/4/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    @State private var settingsViewPresented = false
    
    @State private var analyticsViewPresented = false
    
    @State private var addEntryMenuViewShowing = false
    
    @State private var entrySavedSuccesfully = false
    
    @State private var manualEntryViewShowing = false
    
    @State private var searchEntryViewPresented = false
    
    //@State private var currentGoal = ProteinGoal(dateCreated: Date(), proteinEntries: [ProteinEntry](), proteinGoal: 259)
    
    var body : some View {
        
        GeometryReader { geometry in
            
            ZStack {
                VStack (alignment: .center) {
                    BarMenuView(settingsViewPresented: self.$settingsViewPresented, analyticsViewPresented: self.$analyticsViewPresented)
                    HStack(alignment: .top) {
                        if self.manualEntryViewShowing {
                            ManualEntryView(minWidth: geometry.size.width,showing: self.$manualEntryViewShowing)
                            Spacer()
                        }
                        Spacer()
                        CircleGoalView(proteinCount: 200, proteinGoal: 400)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        CaloriesCircle(width: 110, height: 110, caloriesCount: 240)
                        if self.addEntryMenuViewShowing {
                            AddEntryMenuView(manualEntryViewShowing: self.$manualEntryViewShowing,
                                             entryMenuViewShowing: self.$addEntryMenuViewShowing)
                        }
                    }
                    Spacer()
                    ZStack {
                        HStack {
                            if self.entrySavedSuccesfully {
//                                self.showEntrySavedNotificationBanner()
                            }
                            Spacer()
                            AddEntryMenuButton(function: {
                                withAnimation {
                                    self.addEntryMenuViewShowing.toggle()
                                }
                            }, imageName: "arrowUp", entryMenuShowing: self.addEntryMenuViewShowing)
                        }
                    }
                    Spacer()
                }
                .frame(minWidth: nil, idealWidth: nil, maxWidth: .infinity, minHeight: nil, idealHeight: nil, maxHeight: .infinity, alignment: .center)
                .background(Color.backgroundGrey).edgesIgnoringSafeArea(.all)
            }
        }
    }
    
    func newEntrySaved(successfully: Bool) {
        if successfully {
            withAnimation {
                self.entrySavedSuccesfully.toggle()
            }
        }
    }
    
//    private func showEntrySavedNotificationBanner() -> some View {
//        return EntrySavedBanner(entry: ProteinEntry(created: Date(), calories: 300, protein: 23))
//            .onAppear {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                    withAnimation {
//                        self.entrySavedSuccesfully.toggle()
//                    }
//                }
//            }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}


