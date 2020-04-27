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
    @State private var newEntryMenuViewShowing = false
    @State private var manualEntryViewShowing = false
    @State private var newEntryBannerShouldShow = false
    
    @State private var newJournalEntry : JournalEntry?
    
    @State private var endAngle = Angle.degrees(10)
    @State private var proteinCount = 10
    @State private var proteinGoal = 250
    @State private var caloriesCount = 00
    
    
    var body : some View {
        ZStack {
            VStack {
                HStack {
                    BarButton(imageName: "settings", function: {self.settingsViewPresented.toggle() }, side: .leading, paddingSize: 10)
                        .sheet(isPresented: $settingsViewPresented) { SettingsView() }
                    Spacer()
                    DayText(text:"Monday March 20th")
                    Spacer()
                    BarButton(imageName: "analytics", function: { self.analyticsViewPresented.toggle() }, side: .trailing, paddingSize: 10)
                }
                .frame(minWidth: nil, idealWidth: nil, maxWidth: .infinity, minHeight: 50, idealHeight: nil, maxHeight: 50, alignment: .leading)
                .background(Color.black)
                .padding(.top, 34)
                HStack {
                    ZStack {
                        GoalProgressView(startAngle: .degrees(0), endAngle: .degrees(360), clockwise: true)
                            .stroke(Color.white, lineWidth: 60)
                        GoalProgressView(startAngle: .degrees(0), endAngle: self.endAngle, clockwise: true)
                            .stroke(Color.appGreen, lineWidth: 60)
                            .onTapGesture {
                                withAnimation {
                                    self.endAngle += .degrees(10)
                                }
                        }
                        GoalCountLabel(proteinCount: self.proteinCount, proteinGoal: self.proteinGoal)
                        if self.manualEntryViewShowing {
                            ManualEntryView(isViewShowing: self.$manualEntryViewShowing, newJournalEntry: self.$newJournalEntry, newEntryBannerShouldShow: self.$newEntryBannerShouldShow)
                        }
                    }
                }
                .frame(width: 350, height: 350, alignment: .top)
                Spacer()
                HStack {
                    CaloriesCircle(width: 110, height: 110, caloriesCount: 240)
                }
                Spacer()
                ZStack {
                    HStack {
                        if self.newEntryBannerShouldShow {
                            EntrySavedBanner(entry: JournalEntry(created: Date(), calories: 23, protein: 34, name: "Chicken Enchiladas"))
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                        withAnimation {
                                            self.newEntryBannerShouldShow.toggle()
                                        }
                                    }
                            }
                        }
                        Spacer()
                        AddEntryMenuButton(function: { self.addEntryButtonTapped() }, imageName: "arrowUp", entryMenuShowing: self.newEntryMenuViewShowing)
                        if self.newEntryMenuViewShowing {
                            AddEntryMenuView(manualEntryFunction: self.manualEntryButtonTapped, searchEntryFuntion: self.searchEntryButtonTapped)
                        }
                    }.onAppear {
                        if self.newJournalEntry != nil {
                            withAnimation {
                                self.analyticsViewPresented.toggle()
                            }
                        }
                    }
                }
                Spacer()
            }//VSTACK
                .frame(minWidth: nil, idealWidth: nil, maxWidth: .infinity, minHeight: nil, idealHeight: nil, maxHeight: .infinity, alignment: .center)
                .background(Color.viewControllersGrey).edgesIgnoringSafeArea(.all)
        }
    }
    
    private func addEntryButtonTapped() {
        withAnimation {
            self.newEntryMenuViewShowing.toggle()
        }
    }
    
    private func manualEntryButtonTapped() {
        withAnimation {
            self.manualEntryViewShowing.toggle()
            self.newEntryMenuViewShowing.toggle()
        }
    }
    
    private func searchEntryButtonTapped() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}


