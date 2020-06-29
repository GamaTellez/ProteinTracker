//
//  EntryVIew.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/16/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

struct ManualEntryView : View {
    
    @ObservedObject private var entryVeryfier : EntryVeryfier = EntryVeryfier()
    //@Binding var isViewShowing : Bool
//    @Binding var newJournalEntry : ProteinEntry?
//    @Binding var newEntrySavedSuccessfully : Bool
//    @State private var showActivityView = false
    
    var body : some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: { }) {
                    Image("dismiss").foregroundColor(Color.white)
                }
                .padding(.trailing, 5)
                Text("New Entry")
                .foregroundColor(Color.foreGroundColor)
                .font(AppFonts.title.of(size: 20))
                Spacer()
                if self.entryVeryfier.portionFilled == ProgressPortion.threeThirds {
                    SaveEntryButton(saveAction: self.saveButtonTapped)
                }
            }
            .frame(minWidth: nil, idealWidth: nil, maxWidth: .infinity, minHeight: 50, idealHeight: nil, maxHeight: 50, alignment: .leading)
            .background(Color.black)
            .padding(.top, 32)
            ProgressBar(progressValue: self.$entryVeryfier.portionFilled).frame(height:20)
            VStack(alignment: .leading) {
                EntryTextField(text: self.$entryVeryfier.entryName, type: .name)
                EntryTextField(text: self.$entryVeryfier.entryProtein, type: .protein)
                EntryTextField(text: self.$entryVeryfier.entryCalories, type: .calories)
            }
            Spacer()
        }
        .frame(minWidth: nil, idealWidth: nil, maxWidth: .infinity, minHeight: nil, idealHeight: nil, maxHeight: .infinity, alignment: .leading)
        .background(Color.backgroundGrey).edgesIgnoringSafeArea(.all)
//        .onDisappear {
//            self.savedBannerShouldShow()
//        }
    }
    
    private func savedBannerShouldShow() {
//        if self.newJournalEntry != nil {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//                withAnimation {
//                    self.newEntrySavedSuccessfully.toggle()
//                }
//            }
//        }
    }
    
    private func cancelButtonTapped() {
        withAnimation {
          //  self.isViewShowing.toggle()
        }
    }
    
    private func saveButtonTapped() {
//        self.showActivityView.toggle()
//        if let newJournalEntry = self.entryChecker.saveNewEntry() {
//            self.newJournalEntry = newJournalEntry
//            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {//removew when actually saving to icloud
//                withAnimation {
//                    self.isViewShowing.toggle()
//                }
//            }
//        }
    }
}

struct ManualEntryPreview: PreviewProvider {
    static var previews: some View {
        ManualEntryView()
    }
}

