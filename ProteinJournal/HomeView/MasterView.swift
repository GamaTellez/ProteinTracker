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
    
    var coreDataController : CoreDataController
        
    @State private var settingsViewShowing = false
    
    @State private var analyticsViewShowing = false
    
    @State private var addEntryMenuViewShowing = false
    
    @State private var manualEntryViewShowing = false
    
    @State private var searchEntryViewShowing = false
    
    @State private var newDayViewViewShowing = false
    
    @State private var alertShowing = false
    
    @State private var dayDate = "Tap to start a new day"
    
    var body : some View {
        
        GeometryReader { geometry in
            
            ZStack {
                VStack (alignment: .center) {
                    BarMenuView(settingsViewPresented: self.$settingsViewShowing,
                                analyticsViewPresented: self.$analyticsViewShowing,
                                dayDate: self.coreDataController.currentDay?.date,
                                dayFunction: { self.dayButtonPressed() })
                    
                    HStack(alignment: .top) {
                        if self.manualEntryViewShowing {
                            ManualEntryView(minWidth: geometry.size.width,
                                            showing: self.$manualEntryViewShowing,
                                            coreDataController: self.coreDataController)
                            Spacer()
                        }
                        if self.newDayViewViewShowing {
                            NewDayView(showing: self.$newDayViewViewShowing,
                                       width: geometry.size.width,
                                       coreDataController: self.coreDataController)
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
                                             entryMenuViewShowing: self.$addEntryMenuViewShowing,
                                             alertShowing: self.$alertShowing,
                                             dayAvailable: self.coreDataController.currentDay == nil ? false : true)
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
                            .disabled(self.coreDataController.currentDay == nil || self.newDayViewViewShowing || self.manualEntryViewShowing ? true : false)
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
            }
            
            .onAppear {
            }
            .alert(isPresented: self.$alertShowing) {
                Alert(title: Text("Oops"), message: Text("You need to start a day first."), dismissButton: .default(Text("Got it!")))
            }
        }
    }
    
    internal func dayButtonPressed() {
        withAnimation {
            self.newDayViewViewShowing.toggle()
            if self.addEntryMenuViewShowing {
                self.addEntryMenuViewShowing.toggle()
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterView(coreDataController: CoreDataController())
//    }
//}


