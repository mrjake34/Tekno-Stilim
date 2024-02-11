//
//  Tekno_StilimApp.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 11.02.2024.
//

import SwiftUI

@main
struct Tekno_StilimApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
