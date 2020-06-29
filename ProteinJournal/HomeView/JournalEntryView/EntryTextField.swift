//
//  JournalEntryTextField.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/20/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import SwiftUI

enum TextEntryType {
    case name
    case protein
    case calories
}

struct EntryTextField : View {
    @Binding var text : String
    private var type : TextEntryType
    private var width : CGFloat!
    private var titleText : String!
    
    init(text:Binding<String>, type:TextEntryType) {
        self._text = text
        self.type = type
    }
    
    var body : some View {
        
        VStack(spacing:-5) {
            Text("Name")
                .font(AppFonts.title.of(size: 10))
            .background(Color.purple)
                .padding(.all, 0)

            TextField("", text: self.$text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                //.keyboardType(self.keyboard)
                .background(Color.white)
                .multilineTextAlignment(.center)
                .frame(width: 50, height: 45, alignment: .center)
                .foregroundColor(Color.gray)
        }.background(Color.yellow)
    }
}


