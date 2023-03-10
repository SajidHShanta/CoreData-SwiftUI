//
//  HomeView.swift
//  CoreDataWithMVVM
//
//  Created by Sajid Shanta on 10/3/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = CoreDataViewModel()
    @State private var textFieldText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextField("Add fruits here...", text: $textFieldText)
                        .padding()
                        .font(.headline)
                        .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                        .cornerRadius(10)
                    
                    Button {
                        guard !textFieldText.isEmpty else {
                            return
                        }
                        vm.addFruits(fruitName: textFieldText)
                    } label: {
                        Text("Add")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)))
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                
                List {
                    ForEach(vm.savedEntities) { entity in
                        Text(entity.name ?? "no name")
                    }
                    .onDelete(perform: vm.deletFruit)
//                    .onDelete { index in
//                        vm.deletFruits(indexSet: index)
//                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Fruits")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
