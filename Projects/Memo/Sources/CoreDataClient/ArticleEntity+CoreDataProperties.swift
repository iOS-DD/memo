//
//  ArticleEntity+CoreDataProperties.swift
//  
//
//  Created by jaeyoung Yun on 2023/01/04.
//
//

import Foundation
import CoreData


extension ArticleEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleEntity> {
        return NSFetchRequest<ArticleEntity>(entityName: "ArticleEntity")
    }

    @NSManaged public var id: UUID
    @NSManaged public var content: String
    @NSManaged public var source: String
    @NSManaged public var page: String?
    @NSManaged public var writer: String
    @NSManaged public var createdAt: Date
    @NSManaged public var categoryID: Int32
}
