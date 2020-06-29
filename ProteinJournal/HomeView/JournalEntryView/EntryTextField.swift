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
    
    var name : String {
        switch self {
        case .name:
            return "Name:"
        case .protein:
            return "Protein:"
        case .calories:
            return "Calories:"
        }
    }
}

struct EntryTextField : View {
    @Binding var text : String
    private var type : TextEntryType
    
    private var width : CGFloat!
    private var titleText : String!
    private var keyboardType : UIKeyboardType!
    
    
    init(text:Binding<String>, type:TextEntryType) {
        self._text = text
        self.type = type
        
        switch self.type {
        case .calories, .protein:
            self.keyboardType = .numberPad
            self.width = 60
        case .name:
            self.keyboardType = .default
            self.width = 100
        }
    }
    
    var body : some View {
        VStack(alignment: .leading) {
            Text(self.type.name)
                .font(AppFonts.title.of(size: 15))
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
                .padding(.leading, 10)
                .padding(.bottom, 5)
            TextField("0 g.", text: self.$text)
                .keyboardType(self.keyboardType)
                .background(Color.clear)
                .foregroundColor(Color.white)
                .padding(.leading, 10)
                .frame(width: self.width, height: 0, alignment: .leading)
            Rectangle()
                .frame(width: self.width, height: 1, alignment: .leading)
                .foregroundColor(Color.white)
                .padding(.leading, 5)
        }.frame(minWidth: 100, idealWidth: .infinity, maxWidth: .infinity, minHeight: 50, idealHeight: 50, maxHeight: 50, alignment: .leading)
    }
}


