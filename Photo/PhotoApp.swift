//
//  PhotoApp.swift
//  Photo
//
//  Created by Jhon Diaz on 15/10/23.
//
import Foundation
import SwiftUI

@main
struct PhotoApp: App {
    
    let networkMonitor = NetworkMonitor.sharedNet
    
    init(){}

    var body: some Scene {
        WindowGroup {
            let viewContext = CoreDataManager.sharedCD.persistentStoreContainer.viewContext
            PhotoView().environmentObject(networkMonitor)
                .environment(\.managedObjectContext, viewContext)
        }
    }
}
