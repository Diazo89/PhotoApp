//
//  SavePhotoVM.swift
//  Photo
//
//  Created by Jhon Diaz on 16/10/23.
//

import Foundation
import UIKit
import CoreData
import SwiftUI


class SavePhotoVM: ObservableObject {
    
    @Environment(\.managedObjectContext) private var moc
    static let shared = SavePhotoVM()
    
    init(){
        
    }
    
    
    func start(albump: Int16, idp: Int16, titlep: String, urlp: String, thummbnailp: String){
        let saveData = Photo(context: self.moc)
        saveData.albumId = albump
        saveData.id = idp
        saveData.title = titlep
        saveData.url = urlp
        saveData.thumbnailUrl = thummbnailp
        
        
    }
    
    
    
}
