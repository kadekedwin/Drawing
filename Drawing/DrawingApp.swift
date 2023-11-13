//
//  DrawingApp.swift
//  Drawing
//
//  Created by Kadek Edwin on 12/11/23.
//

import SwiftUI

@main
struct DrawingApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            HomeView()
        }
    }
}
