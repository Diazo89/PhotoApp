//
//  PhotoApp.swift
//  Photo
//
//  Created by Jhon Diaz on 16/10/23.
//

import SwiftUI

@main
struct PhotoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
