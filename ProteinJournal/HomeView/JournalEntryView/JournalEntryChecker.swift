//
//  JournalEntryChecker.swift
//  ProteinJournalTests
//
//  Created by Gamaliel Tellez on 4/25/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import Foundation
import SwiftUI

class EntryChecker : ObservableObject {
    
    @Published var isFormFilled : Bool = false {
        didSet {
            print("Form filled: \(self.isFormFilled)")
        }
    }
    
    var isEntryNameValid : Bool = false {
        didSet {
            withAnimation {
                self.isFormFilled = self.checkFormFilled(validName: self.isEntryNameValid, validProtein: self.isEntryProteinValid, validCalories: self.isEntryCaloriesValid)
            }
        }
    }
    var isEntryProteinValid : Bool = false {
        didSet {
            withAnimation {
                self.isFormFilled = self.checkFormFilled(validName: self.isEntryNameValid, validProtein: self.isEntryProteinValid, validCalories: self.isEntryCaloriesValid)
            }
        }
    }
    var isEntryCaloriesValid : Bool = false {
        didSet {
            withAnimation {
                self.isFormFilled = self.checkFormFilled(validName: self.isEntryNameValid, validProtein: self.isEntryProteinValid, validCalories: self.isEntryCaloriesValid)
            }
        }
    }
    
    var entryName : String = "" {
        didSet {
            print("name:  \(self.entryName)")
            self.isEntryNameValid = self.checkName(name: self.entryName)
        }
    }
    
    var entryProtein : String = "" {
        didSet {
            print("name:  \(self.entryProtein)")
            self.isEntryProteinValid = self.checkProtein(protein:self.entryProtein)
        }
    }
    
    var entryCalories : String = "" {
        didSet {
            print("name:  \(self.entryCalories)")
            self.isEntryCaloriesValid = self.checkCalories(calories:self.entryCalories)
        }
    }
    
    private func checkName(name:String) -> Bool {
        if name.trimmingCharacters(in: .whitespaces).isEmpty {
            return false
        } else {
            return true
        }
    }
    
    private func checkProtein(protein:String) -> Bool {
        if Int(protein) != nil {
            return true
        }
        return false
    }
    
    private func checkCalories(calories:String) -> Bool {
        if Int(calories) != nil {
            return true
        }
        return false
    }
    
    private func checkFormFilled(validName:Bool, validProtein:Bool, validCalories:Bool) -> Bool {
        if validName && validProtein && validCalories {
            return true
        } else {
            return false
        }
    }
}
