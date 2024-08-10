//
//  ContentView.swift
//  LookAtMyData
//
//  Copyright (c) 2024 Aleksander Stojanowski. All rights reserved.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query
    private var toDoItems: [ToDoItem]

    var body: some View {
        List {
            ForEach(toDoItems) { toDoItem in
                Label(toDoItem.name, systemImage: toDoItem.done ? "checkmark.circle" : "circle")
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(PreviewModelContainerProvider.shared.modelContainer)
}
