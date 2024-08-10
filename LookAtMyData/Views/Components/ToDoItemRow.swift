//
//  ToDoItemRow.swift
//  LookAtMyData
//
//  Copyright (c) 2024 Aleksander Stojanowski. All rights reserved.
//

import SwiftData
import SwiftUI

struct ToDoItemRow: View {
    private let toDoItem: ToDoItem

    init(for toDoItem: ToDoItem) {
        self.toDoItem = toDoItem
    }

    var body: some View {
        Label(toDoItem.name, systemImage: toDoItem.done ? "checkmark.circle" : "circle")
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ToDoItemRow(for: PreviewModelContainerProvider.shared.toDoItem)
}
