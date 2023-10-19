//
//  ApiManager.swift
//  Photo
//
//  Created by Jhon Diaz on 15/10/23.
//

import Foundation

enum APError: Error{
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case decodingError
}

class ApiManager {
    
    //Creamos una instancia de la clase para poder acceder a sus funciones de forma publica
    static let shared = ApiManager()
    
    static let baseURL = "https://jsonplaceholder.typicode.com/photos"
    
    init(){}
    
    // Función para obtener la lista de fotos.
    func getListPhoto(completed: @escaping(Result<[PhotoModel], APError>)->Void){
        
        // Guarda la URL de la API.
        guard let url = URL(string: ApiManager.baseURL) else {
            // Si la URL no es válida, devuelve un error.
            completed(.failure(.invalidURL))
            return
        }
        
        //Se crea una tarea de red para obtener los datos de la API.
        let task = URLSession.shared.dataTask(with: url){data, _,error in
            
            // Guarda los datos devueltos por la API.
            guard let data = data else{
                // Si no hay datos, devuelve un error.
                completed(.failure(.decodingError))
                return
            }
            
            do{
                //Se crea un decodificador JSON.
                let decoder = JSONDecoder()
                //Se intenta decodificar los datos devueltos por la API en una lista de objetos PhotoModel.
                let decodedResponse = try decoder.decode([PhotoModel].self,from:data)
                // Si la decodificación es exitosa, devuelve la lista de objetos PhotoModel.
                completed(.success(decodedResponse))
            }catch{
                // Si la decodificación falla, imprime el error en la consola y devuelve un error.
                print("Debug: \(error.localizedDescription)")
                completed(.failure(.decodingError))
            }
        }
        //Inicio de la tarea
        task.resume()
    }

}

//Datos de prueba para PhotoDetailView
struct PreData {
    static let photo = PhotoModel(albumId: 1, id: 1, title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952")
}


