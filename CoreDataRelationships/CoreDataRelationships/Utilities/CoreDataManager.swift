//
//  CoreDataManager.swift
//  CoreDataRelationships
//
//  Created by Sajid Shanta on 11/3/23.
//

import Foundation
import CoreData

class CoreDataManager {
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error on loading Core Data. \(error)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
        } catch let error  {
            print("Error on saving Data. \(error.localizedDescription)")
        }
    }
}
