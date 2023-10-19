//
//  Photo+CoreDataProperties.swift
//  Photo
//
//  Created by Jhon Diaz on 16/10/23.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var albumId: Int16
    @NSManaged public var id: Int16
    @NSManaged public var thumbnailUrl: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?

}

extension Photo : Identifiable {

}
