//
//  ProteinEntry.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/20/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import Foundation

final class ProteinEntry {
    private(set) var dateCreated : Date
    private(set) var calories : Int
    private(set) var protein : Int
    private(set) var name : String
    
    init(created:Date, calories:Int, protein: Int, name:String ) {
        self.dateCreated = created
        self.calories = calories
        self.protein = protein
        self.name = name
    }
}
