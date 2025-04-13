//
//  pickdamApp.swift
//  pickdam
//
//  Created by 송시호 on 4/8/25.
//

import SwiftUI

@main
struct pickdamApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
