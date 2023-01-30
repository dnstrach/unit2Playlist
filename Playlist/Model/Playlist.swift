//
//  Playlist.swift
//  Playlist
//
//  Created by Dominique Strachan on 12/20/22.
//

import Foundation

class Playlist: Codable {
    //let because not updating playlist
    let playlistName: String
    //songs will be updating when adding or deleting songs
    var songs: [Song]
    
    //default song is empty array so that only have to add name to create a playlist
    init(playlistName: String, songs: [Song] = []) {
        self.playlistName = playlistName
        self.songs = songs
    }
}

extension Playlist: Equatable {
    static func == (lhs: Playlist, rhs: Playlist) -> Bool {
        return lhs.playlistName == rhs.playlistName && lhs.songs == rhs.songs
    }
}
