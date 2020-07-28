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
    fileprivate var name : String?
    fileprivate var protein : Int?
    fileprivate var calories : Int?

    var isEntryNameValid : Bool = false {
        didSet {
            withAnimation {
                self.portionFilled = self.checkFormFilled(validName: self.isEntryNameValid, validProtein: self.isEntryProteinValid, validCalories: self.isEntryCaloriesValid)
            }
        }
    }
    var isEntryProteinValid : Bool = false {
        didSet {
            withAnimation {
                self.portionFilled = self.checkFormFilled(validName: self.isEntryNameValid, validProtein: self.isEntryProteinValid, validCalories: self.isEntryCaloriesValid)
            }
        }
    }
    var isEntryCaloriesValid : Bool = false {
        didSet {
            withAnimation {
                self.portionFilled = self.checkFormFilled(validName: self.isEntryNameValid, validProtein: self.isEntryProteinValid, validCalories: self.isEntryCaloriesValid)
            }
        }
    }
    
    var entryName : String = "" {
        didSet {
            self.isEntryNameValid = self.checkName(name: self.entryName)
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
    
    private func checkName(name:String) -> Bool {
        if name.trimmingCharacters(in: .whitespaces).isEmpty {
            return false
        } else {
            self.name = name
            return true
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
    
    private func checkFormFilled(validName:Bool, validProtein:Bool, validCalories:Bool) -> ProgressPortion {        
        if validName && !validProtein && !validCalories {
            return .oneThird
        }
        if !validName && validProtein && !validCalories {
            return .oneThird
        }
        if !validName && !validProtein && validCalories {
            return .oneThird
        }
        if validName && validProtein && !validCalories {
            return .twoThirds
        }
        if validName && !validProtein && validCalories {
            return .twoThirds
        }
        if !validName && validProtein && validCalories {
            return .twoThirds
        }
        if validName && validProtein && validCalories {
            return .threeThirds
        }
        return .none
    }
    
    internal func saveNewEntry() -> ProteinEntry? {
        guard let newEntryName = self.name, let newEntryProtein = self.protein, let newEntryCalories = self.calories else {
            return nil
        }
        return ProteinEntry(created: Date(), calories: newEntryCalories, protein: newEntryProtein, name: newEntryName)
    }
}
