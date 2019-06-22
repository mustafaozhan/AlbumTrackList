//
//  Album.swift
//  AlbumTrackList
//
//  Created by Mustafa Ozhan on 22/06/2019.
//  Copyright © 2019 Mustafa Ozhan. All rights reserved.
//

import Foundation

struct Album: Codable {
    let id,  name, albumArtWork, artist: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case albumArtWork = "album_art_work"
        case artist
    }
}

extension Album {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Album.self, from: data) else { return nil }
        self = me
    }
}
