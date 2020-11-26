//
//  CoreDataControlelr.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 11/24/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import Foundation
import CoreData
import UIKit

final class CoreDataController {
    private let proteinGoalK = "proteinGoal"
    
    private let dayk = "day"
    
    var context : NSManagedObjectContext = {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }()
    
   
}
