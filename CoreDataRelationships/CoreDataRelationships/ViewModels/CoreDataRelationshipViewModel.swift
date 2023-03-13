//
//  CoreDataRelationshipViewModel.swift
//  CoreDataRelationships
//
//  Created by Sajid Shanta on 11/3/23.
//

import Foundation
import CoreData

class CoreDataRelationshipViewModel: ObservableObject {
    let maneger = CoreDataManager.instance
    
    @Published var businessess: [BusinessEntity] = []
    @Published var departments: [DepartmentEntity] = []
    
    init() {
        getBusinessess()
        getDepartments()
    }
    
    func getBusinessess() {
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        
        do {
            businessess = try maneger.context.fetch(request)
        } catch let error {
            print("Error on fetchig data, \(error.localizedDescription)")
        }
    }
    
    func getDepartments() {
        let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
        
        do {
            departments = try maneger.context.fetch(request)
        } catch let error {
            print("Error on fetchig data, \(error.localizedDescription)")
        }
    }
    
    func addBusiness() {
        let newBusiness = BusinessEntity(context: maneger.context)
        newBusiness.name = "10MS"
        
        save()
    }
    
    func addDepartment() {
        let newDepertment = DepartmentEntity(context: maneger.context)
        newDepertment.name = "IT"
        newDepertment.businessess = [businessess[0]]
        
        save()
    }
    
    func save() {
        maneger.save()
        getBusinessess()
        getDepartments()
    }
}
