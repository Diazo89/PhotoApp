//
//  PhotoView.swift
//  Photo
//
//  Created by Jhon Diaz on 17/10/23.
//

import Foundation
import SwiftUI
import CoreData


enum ConnectionState {
    case noInternet
    case internetAvailable
    case unknown
}

struct PhotoView: View {
        
    //Con estar var tenemeos acceso a toda la clase PhotoViewModel
    @StateObject var viewModelPhoto = PhotoViewModel()
    
    //Se utiliza @FetchRequest para recuperar la entidad Photo de Core Data y almacenamos todo en la variable photoStore
    @FetchRequest(entity: Photo.entity(), sortDescriptors: [], predicate: nil) var photoStore: FetchedResults<Photo>
    
    
    init(){
        
    }
    
    var body: some View {
        
        let netWorkFind = NetworkMonitor.sharedNet.checkConnectionState()

        NavigationView{
            switch netWorkFind {
                //INTERNET OFF
                case .noInternet:
                    List(photoStore, id: \.id) {
                        photicoff in
                        NavigationLink(destination: PhotoDetailViewOff()) {
                            HStack {
                                Image(systemName: "fotico.fill")
                                    .data(url: URL(string: photicoff.thumbnailUrl ?? "")!)
                                    .frame(width:150, height:150)
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                                
                                
                                Text(photicoff.title ?? "Untitled")
                                    .bold()
                            }
                        }
                    }
                    .padding(3)
                    
                //INTERNET ON
                case .internetAvailable:
                    List(viewModelPhoto.listPhoto1, id: \.id){
                        photico in
                            NavigationLink(destination: PhotoDetailView(photo: photico)){
                                HStack{
                                        Image(systemName: "fotico.fill")
                                            .data(url: URL(string: photico.thumbnailUrl)!)
                                            .frame(width:150, height:150)
                                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                                            Text(photico.title).bold()
                                    }
              
                            }
                    }
                    .padding(3)
                case .unknown:
                    Text("Estado de la conexión desconocido")
            }
        }
        .navigationTitle("Fotos")
    }
}

//Para darle mejor manejo a las urls de imagenes en la lista
extension Image {
    
    func data(url:URL) -> Self{
        if let data = try? Data(contentsOf: url){
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
    
}



struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}



