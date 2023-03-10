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
    
    @Published var savedEntities: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data. \(error)")
            } else {
                print("Successfully load Cord Data")
            }
        }
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error on freching. \(error.localizedDescription)")
        }
    }
    
    func addFruits(fruitName: String) {
        let newFruits = FruitEntity(context: container.viewContext)
        newFruits.name = fruitName
        
        saveData()
    }
    
    func updateFruit(entity: FruitEntity) {
        let currentName = entity.name ?? ""
        let updatedName = currentName + "!"
        entity.name = updatedName
        
        saveData()
    }
    
    func deletFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print("Error on saving data. \(error.localizedDescription)")
        }
    }
}
