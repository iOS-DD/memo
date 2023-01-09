//
//  CoreDataClient.swift
//  Memo
//
//  Created by jaeyoung Yun on 2023/01/03.
//  Copyright © 2023 Memo. All rights reserved.
//

import CoreData
import Foundation

protocol CoreDataClientProtocol {

    func insertArticleEntity(
        id: UUID,
        content: String,
        source: String,
        writer: String,
        categoryID: Int32,
        page: String?,
        createdAt: Date
    )
    func fetchArticleEntity(offset: Int, limit: Int) -> [ArticleEntity]
    func updateArticleEntity(
        id: UUID,
        content: String?,
        source: String?,
        writer: String?,
        categoryID: Int32?,
        page: String?
    )
    func deleteArticleEntity(_ id: UUID)
}

class CoreDataClient {
    private let modelName: String

    init(modelName: String) {
        self.modelName = modelName
    }

    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { storeDescription, error in
            if let error {
                fatalError("PersistentStore loading error: \(error)")
            }
        }
        return container
    }()

    private lazy var context: NSManagedObjectContext = persistentContainer.viewContext

    private func saveContext() {
        guard context.hasChanges else {
            return
        }
        do {
            try context.save()
        } catch {
            #if DEBUG
            print("Failed to save context: \(error)")
            #endif
        }
    }
}

extension CoreDataClient: CoreDataClientProtocol {

    private var articleEntityEntity: NSEntityDescription? {
        NSEntityDescription.entity(forEntityName: "ArticleEntity", in: context)
    }

    func insertArticleEntity(
        id: UUID = .init(),
        content: String,
        source: String,
        writer: String,
        categoryID: Int32,
        page: String? = nil,
        createdAt: Date = Date()
    ) {
        if let entity = articleEntityEntity {
            let managedObject = NSManagedObject(entity: entity, insertInto: context)
            managedObject.setValue(id, forKey: "id")
            managedObject.setValue(content, forKey: "content")
            managedObject.setValue(source, forKey: "source")
            managedObject.setValue(writer, forKey: "writer")
            managedObject.setValue(categoryID, forKey: "categoryID")
            managedObject.setValue(page, forKey: "page")
            managedObject.setValue(createdAt, forKey: "createdAt")
            saveContext()
        }
    }

    func fetchArticleEntity(offset: Int, limit: Int) -> [ArticleEntity] {
        do {
            let request = ArticleEntity.fetchRequest()
            request.fetchOffset = offset
            request.fetchLimit = limit
            let results = try context.fetch(request)
            return results
        } catch {
            #if DEBUG
            print("Failed to fetch Articles: \(error)")
            #endif
        }

        return []
    }

    func updateArticleEntity(
        id: UUID,
        content: String? = nil,
        source: String? = nil,
        writer: String? = nil,
        categoryID: Int32? = nil,
        page: String? = nil
    ) {
        guard let entity = getEntityByID(id) else {
            return
        }

        if let content {
            entity.content = content
        }
        if let source {
            entity.source = source
        }
        if let writer {
            entity.writer = writer
        }
        if let categoryID {
            entity.categoryID = categoryID
        }
        if let page {
            entity.page = page
        }
        saveContext()
    }

    func deleteArticleEntity(_ id: UUID) {
        guard let entity = getEntityByID(id) else {
            return
        }

        context.delete(entity)

        do {
            try context.save()
        } catch {
            context.rollback()
            #if DEBUG
            print("Failed to delete Article: \(id), \(error)")
            #endif
        }
    }

    private func getEntityByID(_ id: UUID) -> ArticleEntity? {
        do {
            let request = ArticleEntity.fetchRequest()
            request.predicate = NSPredicate(format: "id = %@", id.uuidString)
            let result = try context.fetch(request)
            return result.first
        } catch {
            #if DEBUG
            print("Failed to find Article: \(id)")
            #endif
        }

        return nil
    }
}
