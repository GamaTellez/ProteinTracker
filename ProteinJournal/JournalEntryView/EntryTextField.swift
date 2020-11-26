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
            return "Name"
        case .protein:
            return "Protein"
        case .calories:
            return "Calories"
        }
    }
}

struct EntryTextField : View {
    @Binding var text : String
    private var type : TextEntryType
    
    //private var width : CGFloat!
    private var titleText : String!
    private var keyboardType : UIKeyboardType!
    
    
    init(text:Binding<String>, type:TextEntryType) {
        self._text = text
        self.type = type
        
        switch self.type {
        case .calories, .protein:
            self.keyboardType = .numberPad
        //    self.width = 60
        case .name:
            self.keyboardType = .default
          //  self.width = 200
        }
    }
    
    var body : some View {
        VStack {
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
                .padding(.trailing, 30)
                .multilineTextAlignment(.center)
            Rectangle()
                .frame(minWidth: 100, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 1, idealHeight: 1, maxHeight: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding(.trailing, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.white)
                
        }.frame(minWidth: 100, idealWidth: .infinity, maxWidth: .infinity, minHeight: 50, idealHeight: 50, maxHeight: 50, alignment: .leading)
    }
}

struct EntryTextField_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
