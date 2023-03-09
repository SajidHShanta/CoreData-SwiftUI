//
//  ExploreCoreDataApp.swift
//  ExploreCoreData
//
//  Created by Sajid Shanta on 9/3/23.
//

import SwiftUI

@main
struct ExploreCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
