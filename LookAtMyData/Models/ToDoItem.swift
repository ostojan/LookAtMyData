//
//  ToDoItem.swift
//  LookAtMyData
//
//  Copyright (c) 2024 Aleksander Stojanowski. All rights reserved.
//

import SwiftData

@Model
final class ToDoItem: Codable {
    private enum CodingKeys: CodingKey {
        case name
        case done
    }

    var name = ""
    var done = false

    init(name: String = "", done: Bool = false) {
        self.name = name
        self.done = done
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        done = try container.decode(Bool.self, forKey: .done)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(done, forKey: .done)
    }
}
