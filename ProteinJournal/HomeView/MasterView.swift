//
//  ContentView.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/4/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

struct MasterView: View {
//    @State private var iCloudAvailable : Bool = UserDefaults.standard.bool(forKey: Constants.ICloudKeys.isICloudAvailable)
    @State var settingsViewPresented = false
    @State var analyticsViewPresented = false
    
    @State private var newEntryMenuShouldShow = false
    @State private var manualEntryViewShouldShow = false
    
    @State private var newEntrySavedSuccesfully = false
    @State private var manualEntryViewPresented = false
    @State private var searchEntryViewPresented = false
    @State private var newJournalEntry : ProteinEntry?
    @State private var currentGoal = ProteinGoal(dateCreated: Date(), proteinEntries: [ProteinEntry](), proteinGoal: 259)
    @ObservedObject var ckController : CKController = CKController()
    
    
    var body : some View {
        ZStack {
            if self.ckController.iCloudStatus == ICloudStatus.checking || self.ckController.iCloudStatus == ICloudStatus.notAvailable {
                VStack {
                    ICloudAnimationView(status: self.ckController.iCloudStatus)
                        .onAppear() {
                            self.ckController.getUserRecordID { (cloudError) in
                                guard cloudError != nil else {
                                    
                                    return
                                }
                            }
                    }
                }.frame(minWidth: nil, idealWidth: nil, maxWidth: .infinity, minHeight: nil, idealHeight: nil, maxHeight: .infinity)
                    .background(Color.backgroundGrey)
                    .edgesIgnoringSafeArea(.all)
            } else {
                VStack {
                    BarMenuView(settingsViewPresented: self.$settingsViewPresented, analyticsViewPresented: self.$analyticsViewPresented)
                        CircleGoalView(proteinCount: 200, proteinGoal: 400)
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


