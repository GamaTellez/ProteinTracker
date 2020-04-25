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
    @Binding var isShowing : Bool
    @Binding var newJournalEntry : JournalEntry?
    
    var body : some View {
        VStack {
            Text("New Entry")
                .foregroundColor(Color.white)
                .font(Font.custom("StringHelveticaNeue-CondensedBold", size: 20))
                .padding(10)
                JournalEntryTextField(placeHolder: "Name", textBinding: $entryChecker.entryName, keyBoard: .default)
                JournalEntryTextField(placeHolder: "Protein", textBinding: $entryChecker.entryProtein, keyBoard: .numberPad)
                JournalEntryTextField(placeHolder: "Calories", textBinding: $entryChecker.entryCalories, keyBoard: .numberPad)
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Button(action: { self.cancelButtonTapped() }) {
                        Text("Cancel")
                    }
                    .foregroundColor(Color.white)
                    .font(Font.custom("StringHelveticaNeue-CondensedBold", size: 20))
                    .frame(width: 100, height: 30, alignment: .center)
                    .border(Color.white, width: 1)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1))
                    Spacer()
                }
                Spacer()
                VStack {
                   
                    Spacer()
                    Button(action: { self.saveButtonTapped() }) {
                        Text("Save")
                    }
                    .foregroundColor(Color.white)
                    .disabled(!self.entryChecker.isFormFilled)
                    .font(Font.custom("StringHelveticaNeue-CondensedBold", size: 20))
                    .frame(width: self.entryChecker.isFormFilled ? 130 : 100, height: self.entryChecker.isFormFilled ? 50 : 30, alignment: .center)
                    .border(Color.white, width: 1)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1))
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.2)))
                    Spacer()
                }
                Spacer()
            }
            Spacer()
        }
        .frame(width: 300, height: 280, alignment: .center)
        .background(Color.black)
        .cornerRadius(20)
        .transition(AnyTransition.opacity.combined(with: .scale))
    }
    
    private func cancelButtonTapped() {
        withAnimation {
            self.isShowing.toggle()
        }
    }
    
    private func saveButtonTapped() {
        print("It is enabled")
    }
}
