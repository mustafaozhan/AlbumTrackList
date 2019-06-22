//
//  Track.swift
//  AlbumTrackList
//
//  Created by Mustafa Ozhan on 22/06/2019.
//  Copyright © 2019 Mustafa Ozhan. All rights reserved.
//

import Foundation

struct Track: Codable {
    let id, name, trackArtWork, trackAlbum: String
    let artist: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case trackArtWork = "track_art_work"
        case trackAlbum = "track_album"
        case artist
    }
}

extension Track {
    init?(data: Data) {
        do {
            let me  = try JSONDecoder().decode(Track.self, from: data)
            self = me
        } catch {
            print(error)
            return nil
        }
    }
}
