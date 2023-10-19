//
//  PhotoModel.swift
//  Photo
//
//  Created by Jhon Diaz on 17/10/23.
//

import Foundation

struct PhotoModel: Codable, Hashable {
    
    let albumId: Int16
    let id: Int16
    let title: String
    let url: String
    let thumbnailUrl: String
    
}

