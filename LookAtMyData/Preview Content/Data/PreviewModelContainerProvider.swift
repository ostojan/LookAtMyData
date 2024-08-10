//
//  PreviewModelContainerProvider.swift
//  LookAtMyData
//
//  Copyright (c) 2024 Aleksander Stojanowski. All rights reserved.
//

import SwiftData
import UIKit

@MainActor
final class PreviewModelContainerProvider {
    static let shared = PreviewModelContainerProvider()

    let modelContainer: ModelContainer

    private init() {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        do {
            modelContainer = try ModelContainer(for: ToDoItem.self, configurations: configuration)
        } catch {
            fatalError("Could not create ModelContainer")
        }

        guard let previewData = NSDataAsset(name: "ToDoItemPreviewsData")?.data else {
            fatalError("Preview data not found")
        }

        do {
            let toDoItems = try JSONDecoder().decode([ToDoItem].self, from: previewData)
            for toDoItem in toDoItems {
                modelContainer.mainContext.insert(toDoItem)
            }
        } catch {
            fatalError("Could not decode preview data")
        }
    }
}
