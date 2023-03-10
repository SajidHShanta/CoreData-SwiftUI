//
//  CoreDataViewModel.swift
//  CoreDataWithMVVM
//
//  Created by Sajid Shanta on 10/3/23.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data. \(error)")
            } else {
                print("Successfully load Cord Data")
            }
        }
    }
}
