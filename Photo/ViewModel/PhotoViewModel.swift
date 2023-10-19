//
//  PhotoViewModel.swift
//  Photo
//
//  Created by Jhon Diaz on 17/10/23.
//

import Foundation
import CoreData
import UIKit
import SwiftUI
import Reachability

class PhotoViewModel: ObservableObject{
        
    //Se obtiene obtiene el contexto de vista del almacén persistente compartido de Core Data.
    let context = CoreDataManager.sharedCD.persistentStoreContainer.viewContext
    
    // Propiedad publica que almacena una lista de objetos PhotoModel.
    @Published var listPhoto1 = [PhotoModel]()
    
    init(){
        getListPhoto()
    }
        
    func getListPhoto() {
        //Llamamos a la funcion getListPhoto para obtener los datos la API
        ApiManager.shared.getListPhoto { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let listPhoto):
                    print("Lista de Fotos: \(listPhoto.count)")
                    //Pasarlos por el modelo Photomodel
                    self.listPhoto1 = listPhoto
                    
                    //Luego agregarlos en la entidad Photo(Core Data)
                    for item in listPhoto{
                        
                        let newItem = Photo(context: self.context)
                        newItem.albumId = Int16(item.albumId)
                        newItem.id = item.id
                        newItem.title = item.title
                        newItem.url = item.url
                        newItem.thumbnailUrl = item.thumbnailUrl
            
                    }
                    
                    do{
                        //Luego guardalos de manera permanente
                        try self.context.save()
                        print("Datos agregados a CoreData con éxito.")
                        
                    }catch {
                        print("Error al guardar los datos en CoreData: \(error)")
                    }
                
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
    

}

