//
//  EntryVIew.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/16/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI


struct ManualEntryView : View {
    
    @ObservedObject private var entryChecker : EntryChecker = EntryChecker()
    @Binding var isViewShowing : Bool
    @Binding var newJournalEntry : JournalEntry?
    @Binding var newEntryBannerShouldShow : Bool
    @State private var showActivityView = false
    
    var body : some View {
        VStack {
            Text("New Entry")
                .foregroundColor(Color.white)
                .font(Font.custom("StringHelveticaNeue-CondensedBold", size: 20))
                .padding(10)
                .frame(width: 280, height: 50, alignment: .center)
            JournalEntryTextField(placeHolder: "Name", textBinding: $entryChecker.entryName, keyBoard: .default)
            JournalEntryTextField(placeHolder: "Protein", textBinding: $entryChecker.entryProtein, keyBoard: .numberPad)
            JournalEntryTextField(placeHolder: "Calories", textBinding: $entryChecker.entryCalories, keyBoard: .numberPad)
            
            if !self.showActivityView {
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        NewEntryButton(saveAction: self.cancelButtonTapped, entryChecker: self.entryChecker, type: .cancel)
                        Spacer()
                    }
                    Spacer()
                    VStack {
                        Spacer()
                        NewEntryButton(saveAction: self.saveButtonTapped, entryChecker: self.entryChecker, type: .save)
                        Spacer()
                    }
                    Spacer()
                }
            }
            if showActivityView {
                HStack {
                    ShowActivityView()
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(Color.white)
                }
            }
            Spacer()
        }
        .frame(width: 300, height: 280, alignment: .center)
        .background(Color.black)
        .cornerRadius(20)
        .transition(AnyTransition.opacity.combined(with: .scale))
        .onDisappear {
            self.masterViewEntrySavedBannerShouldShow()
        }
    }
    
    private func masterViewEntrySavedBannerShouldShow() {
        if self.newJournalEntry != nil {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.newEntryBannerShouldShow.toggle()
                }
            }
        }
    }
    
    private func cancelButtonTapped() {
        withAnimation {
            self.isViewShowing.toggle()
        }
    }
    
    private func saveButtonTapped() {
        self.showActivityView.toggle()
        if let newJournalEntry = self.entryChecker.newEntry() {
            self.newJournalEntry = newJournalEntry
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {//removew when actually saving to icloud
                withAnimation {
                    self.isViewShowing.toggle()
                }
            }
        }
    }
}
