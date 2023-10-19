//
//  PhotoDetailView.swift
//  Photo
//
//  Created by Jhon Diaz on 17/10/23.
//
import SwiftUI

struct PhotoDetailView: View {
    
    let photo: PhotoModel
    
    var body: some View {
        
        VStack{
            Image(systemName: "photo.fill")
                .data(url: URL(string: photo.url)!)
                .frame(width:350, height:350)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
            Text(photo.title).bold()
        }
    }
}


struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView(photo: PreData.photo)
    }
}



