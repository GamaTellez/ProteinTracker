//
//  ProteinEntry.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/20/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import Foundation

final class JournalEntry {
    private var dateCreated : Date
    private var calories : Int
    private var protein : Int
    private var name : String
    
    init(created:Date, with calories:Int, protein: Int, name:String ) {
        self.dateCreated = created
        self.calories = calories
        self.protein = protein
        self.name = name
    }
}
