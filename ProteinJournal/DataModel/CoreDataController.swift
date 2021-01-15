//
//  CoreDataControlelr.swift
//  ProteinJournal
//
//  Created by Gamaliel Tellez on 11/24/20.
//  Copyright © 2020 GamaTellez. All rights reserved.
//

import Foundation
import CoreData


enum AppeEntities {
    case proteinGoal, day, entry
}

final class CoreDataController : ObservableObject {
    
    @Published private(set) var currentDay : Day?
    
    private var persistantContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Model")
        
        container.loadPersistentStores { (storeDescriptor, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)" )
            }
        }
        
        return container
    }()
    
    private var context : NSManagedObjectContext!
    
    init() {
        self.context = self.persistantContainer.newBackgroundContext()
        self.currentDay = self.getCurrentDay()
    }
    
    internal func createProteinEntry(calories: Int, protein: Int, completion: @escaping (Bool)-> Void) {
        
        self.context.perform {
            let newEntry = ProteinEntry(context: self.context)
            newEntry.protein = Int16(protein)
            newEntry.calories = Int16(calories)
            newEntry.date = Date()
            
            completion(try! self.context.saveIfNeeded())
        }
    }
    
    internal func createDay( proteinGoal: Int?, completion: @escaping (_ saved : Bool)  -> Void) {
        self.context.perform {
            let newDay = Day(context: self.context)
            newDay.date = Date()
            newDay.proteinGoal = Int16(proteinGoal ?? 0)
            
            if try! self.context.saveIfNeeded() {
                self.currentDay = newDay
                completion(true)
            } else {
                self.currentDay = nil
                completion(false)
            }            
        }
    }
    
    private func getCurrentDay() -> Day? {
        let dateSortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        guard let days = try? self.context.fetchObjects(entity: Day.self,
                                                   sortBy: [dateSortDescriptor],
                                                   predicate: nil),
              !days.isEmpty else { return nil }
        return days[0]
    }
}


extension NSManagedObject {
    class func entityName() -> String {
        return String(describing: self)
    }
    
    convenience init(context: NSManagedObjectContext) {
        let eName = type(of: self).entityName()
        let entity = NSEntityDescription.entity(forEntityName: eName, in: context)!
        self.init(entity: entity, insertInto: context)
    }
}

extension NSManagedObjectContext {
    @discardableResult public func saveIfNeeded() throws -> Bool {
        guard self.hasChanges else { return false }
        try save()
        return true
    }
    
    func fetchObjects <T:NSManagedObject> (entity:T.Type,
                                           sortBy:[NSSortDescriptor]? = nil,
                                           predicate: NSPredicate? = nil) throws -> [T] {
        let request: NSFetchRequest<T>
        request = entity.fetchRequest() as! NSFetchRequest<T>
        request.returnsObjectsAsFaults = false
        request.predicate = predicate
        request.sortDescriptors = sortBy
        
        return try self.fetch(request)
    }
}



