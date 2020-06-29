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

struct SaveEntryButton : View {
    var saveAction : () -> Void
    var entryChecker : EntryVeryfier
    var type : NewEntryButtonType
    
    var body : some View {
        Button(action: { self.saveAction() }) {
            Text(self.type == .cancel ? "Cancel" : "Save")
        }
        .foregroundColor(Color.foreGroundColor)
//        .disabled(self.type == .cancel ? self.entryChecker.isFormFilled : !self.entryChecker.isFormFilled)
        .font(Font.custom("StringHelveticaNeue-CondensedBold", size: 20))
//        .frame(width: self.type == .cancel ? (!self.entryChecker.isFormFilled ? 130 : 100) : (!self.entryChecker.isFormFilled ? 100 : 130), height: self.type == .cancel ? (!self.entryChecker.isFormFilled ? 50 : 30) : (!self.entryChecker.isFormFilled ? 30 : 50), alignment: .center)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.1)))
    }
}
