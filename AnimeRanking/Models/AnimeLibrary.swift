//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Kevin Truong on 2023-02-22.
//

import Foundation

struct AnimeLibrary: Identifiable {
    let id: UUID
    var title: String
    var characters: [AnimeCharacter]
    
    init(id: UUID = UUID(), title: String, characters: [String]) {
        self.id = id
        self.title = title
        self.characters = characters.map { AnimeCharacter(name: $0) }
        // just for testing, TODO: remove
        HomePageViewController().queryAllAnime()
    }
}

extension AnimeLibrary {
    struct AnimeCharacter: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    struct Data {
        var title: String = ""
        var characters: [AnimeCharacter] = []
    }
    var data: Data {
        Data(title: title, characters: characters)
    }
    mutating func update(from data: Data) {
        title = data.title
        characters = data.characters
    }
    init(data: Data) {
        id = UUID()
        title = data.title
        characters = data.characters
    }
}

// sample data for functionality testing. Will need to replaced with API data.
extension AnimeLibrary {
    static let sampleData: [AnimeLibrary] =
    [
        AnimeLibrary(title: "Code Geass", characters: ["Lelouch", "Suzaku"]),
        AnimeLibrary(title: "One Piece", characters: ["Luffy", "Zoro"]),
        AnimeLibrary(title: "Demon Slayer", characters: ["Tanjiro", "Nezuko"])
    ]
}
