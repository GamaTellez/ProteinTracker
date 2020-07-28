//
//  SaveEntryButton.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/27/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

struct SaveEntryButton : View {
    var saveAction : () -> Void
    var body : some View {
        Button(action: { self.saveAction() }) {
            Image("upload")
                .padding(.trailing, 5)
        }
        .foregroundColor(Color.foreGroundColor)
        .font(AppFonts.title.of(size: 20))
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.5)))
    }
}
