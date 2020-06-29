//
//  ProteinGoal.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 4/29/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import Foundation

final class ProteinGoal {
    private(set) var dateCreated : Date
    private(set) var proteinEntries : [ProteinEntry]
    private(set) var proteinGoal : Int
    private(set) var proteinCount = 0
    private(set) var caloriesCount = 0
    private(set) var isCurrentGoal = true
    
    init(dateCreated: Date, proteinEntries: [ProteinEntry], proteinGoal: Int) {
        self.dateCreated = dateCreated
        self.proteinEntries = proteinEntries
        self.proteinGoal = proteinGoal
    }
}

