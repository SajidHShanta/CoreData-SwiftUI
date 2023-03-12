//
//  CoreDataRelationshipViewModel.swift
//  CoreDataRelationships
//
//  Created by Sajid Shanta on 11/3/23.
//

import Foundation

class CoreDataRelationshipViewModel: ObservableObject {
    let maneger = CoreDataManager.instance
    
    @Published var business: [BusinessEntity] = []
    
    func addBusiness() {
        let newBusiness = BusinessEntity(context: maneger.context)
        newBusiness.name = "10MS"
        maneger.save()
    }
}
