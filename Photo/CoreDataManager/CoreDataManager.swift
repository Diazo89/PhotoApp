//
//  CoreDataManager.swift
//  Photo
//
//  Created by Jhon Diaz on 16/10/23.
//

import Foundation
import CoreData

class CoreDataManager {
    
    // Contenedor persistente utilizado para administrar el almacenamiento de datos Core Data.
    let persistentStoreContainer: NSPersistentContainer
    
    // Instancia compartida de CoreDataManager para proporcionar acceso public
    static let sharedCD = CoreDataManager()
    
    private init(){
        persistentStoreContainer = NSPersistentContainer(name: "PhotoDataModel")
        persistentStoreContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store Fail \(error.localizedDescription)")
            }
            
        }
    }
    
    
    
    
    
    
    
    
}

