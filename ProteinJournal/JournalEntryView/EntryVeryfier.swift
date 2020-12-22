//
//  JournalEntryChecker.swift
//  ProteinJournalTests
//
//  Created by Gamaliel Tellez on 4/25/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import Foundation
import SwiftUI

final class EntryVeryfier : ObservableObject {
    
    @Published var portionFilled : ProgressPortion = .none

    internal var protein : Int = 0
    
    internal var calories : Int = 0

    var isEntryProteinValid : Bool = false {
        didSet {
            withAnimation {
                self.portionFilled = self.checkFormFilled(validProtein: self.isEntryProteinValid, validCalories: self.isEntryCaloriesValid)
            }
        }
    }
    var isEntryCaloriesValid : Bool = false {
        didSet {
            withAnimation {
                self.portionFilled = self.checkFormFilled(validProtein: self.isEntryProteinValid, validCalories: self.isEntryCaloriesValid)
            }
        }
    }
        
    var entryProtein : String = "" {
        didSet {
            self.isEntryProteinValid = self.checkProtein(protein:self.entryProtein)
        }
    }
    
    var entryCalories : String = "" {
        didSet {
            self.isEntryCaloriesValid = self.checkCalories(calories:self.entryCalories)
        }
    }
    
    private func checkProtein(protein:String) -> Bool {
        if let theProtein = Int(protein) {
            self.protein = theProtein
            return true
        }
        return false
    }
    
    private func checkCalories(calories:String) -> Bool {
        if let theCalories = Int(calories) {
            self.calories = theCalories
            return true
        }
        return false
    }
    
    private func checkFormFilled(validProtein:Bool, validCalories:Bool) -> ProgressPortion {
        if validProtein && !validCalories || !validProtein && validCalories {
            return .half
        }
        if !validProtein && !validCalories {
            return .none
        }
        if validProtein && validCalories {
            return .whole
        }
        return .none
    }
    
//    internal func saveNewEntry() -> ProteinEntry? {
//        guard let newEntryProtein = self.protein, let newEntryCalories = self.calories else {
//            return nil
//        }
//        return ProteinEntry(created: Date(), calories: newEntryCalories, protein: newEntryProtein)
//    }
}
