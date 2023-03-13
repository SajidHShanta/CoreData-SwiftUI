//
//  CoreDataRelationshipView.swift
//  CoreDataRelationships
//
//  Created by Sajid Shanta on 11/3/23.
//

import SwiftUI

struct CoreDataRelationshipView: View {
    @StateObject var vm = CoreDataRelationshipViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Button {
                        vm.addBusiness()
                    } label: {
                        Text("ADD BUSINESS")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .cornerRadius(10)
                    }
                    
                    Button {
                        vm.addDepartment()
                    } label: {
                        Text("ADD DEPARTMENT")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .cornerRadius(10)
                    }
                    
                    Text("Business")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(vm.businessess) { business in
                                businessView(businessEntity: business)
                                    .padding()
                                    .frame(maxWidth: 300, alignment: .leading)
                                    .background(.gray.opacity(0.2))
                                    .cornerRadius(10)
                            }
                        }
                    }
                    
                    Text("Departments")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(vm.departments) { department in
                                departmentView(departmentEntity: department)
                                    .padding()
                                    .frame(maxWidth: 300, alignment: .leading)
                                    .background(.green.opacity(0.2))
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Relationships")
        }
    }
}

struct CoreDataRelationshipView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataRelationshipView()
    }
}

extension CoreDataRelationshipView {
    func businessView(businessEntity: BusinessEntity) -> some View {
        VStack {
            Text(businessEntity.name ?? "")
                .bold()
            
            if let departments = businessEntity.departments?.allObjects as? [DepartmentEntity] {
                Text("Departments:")
                    .bold()
                ForEach(departments) { department in
                    Text(department.name ?? "")
                }
            }
            
            if let employees = businessEntity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees:")
                    .bold()
                
                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                        .bold()
                }
            }
        }

    }
    
    func departmentView(departmentEntity: DepartmentEntity) -> some View {
        VStack {
            Text(departmentEntity.name ?? "")
                .bold()
            
            if let businessess = departmentEntity.businessess?.allObjects as? [BusinessEntity] {
                Text("Businessess:")
                    .bold()
                ForEach(businessess) { business in
                    Text(business.name ?? "")
                }
            }
            
            if let employees = departmentEntity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees:")
                    .bold()
                
                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                        .bold()
                }
            }
        }

    }
}
