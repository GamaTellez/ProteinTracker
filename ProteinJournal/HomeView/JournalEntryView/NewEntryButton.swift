//
//  SaveEntryButton.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/27/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

enum NewEntryButtonType {
    case save, cancel
}

struct NewEntryButton : View {
    var saveAction : () -> Void
    var entryChecker : EntryChecker
    var type : NewEntryButtonType
    
    var body : some View {
        Button(action: { self.saveAction() }) {
            Text(self.type == .cancel ? "Cancel" : "Save")
        }
        .foregroundColor( self.type == .cancel ? (self.entryChecker.isFormFilled ? Color.white : Color.appGreen) : (self.entryChecker.isFormFilled ? Color.appGreen : Color.white))
        .disabled(self.type == .cancel ? self.entryChecker.isFormFilled : !self.entryChecker.isFormFilled)
        .font(Font.custom("StringHelveticaNeue-CondensedBold", size: 20))
        .frame(width: self.type == .cancel ? (!self.entryChecker.isFormFilled ? 130 : 100) : (!self.entryChecker.isFormFilled ? 100 : 130), height: self.type == .cancel ? (!self.entryChecker.isFormFilled ? 50 : 30) : (!self.entryChecker.isFormFilled ? 30 : 50), alignment: .center)
        .border(Color.white, width: 1)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(self.type == .cancel ? (!self.entryChecker.isFormFilled ? Color.appGreen : Color.white) : (self.entryChecker.isFormFilled ? Color.appGreen : Color.white)    , lineWidth: 1))
        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.1)))
    }
}
