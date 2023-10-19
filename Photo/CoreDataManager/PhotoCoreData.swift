//
//  PhotoCoreData.swift
//  Photo
//
//  Created by Jhon Diaz on 16/10/23.
//

import Foundation
import SwiftUI

struct PhotoCoreData: View {
    
    @Environment(\.man)
    
    private var items: FetchedResults<Photo>
    
    func DataEntity(){
        @FetchedResults(
            sortDescriptor: [NSSortDescriptor(keyPath: \Photo.id, ascending:
              true)],
            animation: .default)
    }
    
        

}
