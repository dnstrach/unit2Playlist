//
//  Song.swift
//  Playlist
//
//  Created by Dominique Strachan on 12/19/22.
//

import Foundation

//blueprint for creating a song
class Song: Codable {
    
    //blueprint for variable types
    let title: String
    let artist: String
    
    //run initializer method each time song instance is created
    //takes in info/parameters and assigns properties
    //assign parameters values containing specified types
    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
    }
}

//inializing songs
//let newSong = Song(title: "Viva la Vida", artist: "Coldplay")
//let secondSong = Song(title: "Three Little Birds", artist: "Bob Marley")

//conform to equatable protocol
//requires static func for lhs and rhs
//runs function until finding match
extension Song: Equatable{
    static func == (lhs: Song, rhs: Song) -> Bool {
        //in order for 2 songs to be equal need the following 
        return lhs.title == rhs.title && lhs.artist == rhs.artist
    }
}
