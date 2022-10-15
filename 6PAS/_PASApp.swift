//
//  _PASApp.swift
//  6PAS
//
//  Created by Fatih Toker on 15.10.2022.
//

import SwiftUI

@main
struct _PASApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
