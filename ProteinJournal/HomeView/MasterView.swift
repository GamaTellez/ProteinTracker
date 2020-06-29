//
//  ContentView.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/4/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    @State private var iCouldEnabled = true
    @State var settingsViewPresented = false
    @State var analyticsViewPresented = false
    @State private var newEntryMenuShouldShow = false
    @State private var manualEntryViewShouldShow = false
    @State private var newEntrySavedSuccesfully = false
    @State private var proteinCountChanged = false
    @State private var manualEntryViewPresented = false
    @State private var searchEntryViewPresented = false
    @State private var newJournalEntry : ProteinEntry?
    @State private var currentGoal = ProteinGoal(dateCreated: Date(), proteinEntries: [ProteinEntry](), proteinGoal: 259)
    
    init() {
        
    }
    var body : some View {
        ZStack {
            
            if self.iCouldEnabled {
                VStack {
                    BarMenuView(settingsViewPresented: self.$settingsViewPresented, analyticsViewPresented: self.$analyticsViewPresented)
                    ZStack {
                        CircleGoalView(proteinCount: 200, proteinGoal: 400)
                    }
                    Spacer()
                    HStack {
                        CaloriesCircle(width: 110, height: 110, caloriesCount: 240)
                        if self.newEntryMenuShouldShow {
                            AddEntryMenu(manualEntryViewPresented: self.$manualEntryViewPresented, searchEntryViewPresented: self.$searchEntryViewPresented)
                        }
                    }
                    Spacer()
                    ZStack {
                        HStack {
                            if self.newEntrySavedSuccesfully {
                                self.showEntrySavedNotificationBanner()
                            }
                            Spacer()
                            AddEntryButton(function: { self.addEntryButtonTapped() }, imageName: "arrowUp", entryMenuShowing: self.newEntryMenuShouldShow)
                        }.onAppear {
                            if self.newJournalEntry != nil {
                                withAnimation {
                                    self.analyticsViewPresented.toggle()
                                }
                            }
                        }
                    }
                    Spacer()
                }
                .frame(minWidth: nil, idealWidth: nil, maxWidth: .infinity, minHeight: nil, idealHeight: nil, maxHeight: .infinity, alignment: .center)
                .background(Color.backgroundGrey).edgesIgnoringSafeArea(.all)
            } else {
                VStack {
                    Text("Protein Journal needs your iCloud drive to be turned on to store your data. Don't worry though, you can easily delete it at anytime")
                        .multilineTextAlignment(.center)
                }.frame(minWidth: nil, idealWidth: nil, maxWidth: .infinity, minHeight: nil, idealHeight: nil, maxHeight: .infinity, alignment: .center)
                    .background(Color.backgroundGrey).edgesIgnoringSafeArea(.all)
            }
        }
    }
    
    private func showEntrySavedNotificationBanner() -> some View {
        return EntrySavedBanner(entry: self.newJournalEntry!)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        self.newEntrySavedSuccesfully.toggle()
                        self.newJournalEntry = nil
                    }
                }
        }
    }
    
    private func addEntryButtonTapped() {
        withAnimation {
            self.newEntryMenuShouldShow.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}


