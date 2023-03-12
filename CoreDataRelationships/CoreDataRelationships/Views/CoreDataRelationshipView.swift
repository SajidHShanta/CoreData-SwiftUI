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
                VStack {
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
