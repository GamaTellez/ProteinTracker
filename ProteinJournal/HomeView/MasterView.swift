//
//  ContentView.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/4/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI
import CoreData

struct MasterView: View {
    
    var currentDayID : NSManagedObjectID?
    
    var coreDataController : CoreDataController
    
    @State private var settingsViewPresented = false
    
    @State private var analyticsViewPresented = false
    
    @State private var addEntryMenuViewShowing = false
    
    @State private var manualEntryViewShowing = false
    
    @State private var searchEntryViewPresented = false
    
    @State private var dayDate = ""
    
    var body : some View {
        
        GeometryReader { geometry in
            ZStack {
                VStack (alignment: .center) {
                    BarMenuView(settingsViewPresented: self.$settingsViewPresented,
                                analyticsViewPresented: self.$analyticsViewPresented,
                                dayDate: self.$dayDate,
                                dayFunction: {
                                    self.dayButtonPressed()
                                })
                    HStack(alignment: .top) {
                        if self.manualEntryViewShowing {
                            ManualEntryView(minWidth: geometry.size.width,
                                            showing: self.$manualEntryViewShowing,
                                            coreDataController: self.coreDataController)
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
                .frame(minWidth: nil,
                       idealWidth: nil,
                       maxWidth: .infinity,
                       minHeight: nil,
                       idealHeight: nil,
                       maxHeight: .infinity,
                       alignment: .center)
                .background(Color.backgroundGrey).edgesIgnoringSafeArea(.all)
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                Day.saveDay()
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                if Day.isNewDay() {
                    print("it is a new day")
                }
            }.onAppear {
                guard let dayID = self.currentDayID,
                      let currentDay = self.coreDataController.getObject(entity: Day.self, objID: dayID) else {
                    return
                }
                self.dayDate = currentDay.readableDate() ?? "Tap to start a new day"
            }
        }
    }
    
    internal func dayButtonPressed() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(currentDayID: NSManagedObjectID(), coreDataController: CoreDataController())
    }
}


