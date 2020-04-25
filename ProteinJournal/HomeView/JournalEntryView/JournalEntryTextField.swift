//
//  JournalEntryTextField.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/20/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

struct JournalEntryTextField : View {
    var placeHolder : String
    @Binding var textBinding : String
    
    var keyBoard : UIKeyboardType
    var body : some View {
        
        TextField(self.placeHolder, text: self.$textBinding)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(self.keyBoard)
            .background(Color.white)
            .multilineTextAlignment(.center)
            .frame(width: 280, height: 45, alignment: .center)
            .foregroundColor(Color.gray)
    }
}
