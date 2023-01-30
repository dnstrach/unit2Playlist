//
//  SongController.swift
//  Playlist
//
//  Created by Dominique Strachan on 12/19/22.
//

import Foundation

//controller where we can manipulate songs...CRUD

class SongController {
    
    //shared instance
    //add static to maked shared a class property instead of instance property
    //static creates a class property rather than instance property which provides access to other files?
    //static let shared = SongController() ----> refactoring
    
    // Source of truth - entire of app is running on variable songs
    //song objects added to empty array
    //var because array will change (add/delete employees)
    //var songs: [Song] = [] ----> refactoring
    
    //CRUD
    //Create - create or add
    //Read - have info stored on cloud server or website and read/pull data and convert into song
    //Update
    //Delete
    
    //Create function
    //need title and artist parameters
    //refactoring - adding playlist as a parameter
    //static makes function accessible in other files
    static func createSong (title: String, artist: String, playlist: Playlist) {
        //creating song instance
        let newSong = Song(title: title, artist: artist)
        playlist.songs.append(newSong)
        //persistence is now in playlist controller
        PlaylistController.shared.saveToPersistenceStore()
        //adding newSong to songs array
//        songs.append(newSong)
//        saveToPersistenceStore()
    }
    
    //Read - have info stored in cloud server or website and pull data
    
    //Update
    
    //Delete
    //have to create equatable extension in model
    //new lines of code - refactoring
    //static makes function accessible in other files
    static func deleteSong(song: Song, playlist: Playlist) {
        guard let index = playlist.songs.firstIndex(of: song) else { return }
        //guard let index = songs.firstIndex(of: song) else { return }
        playlist.songs.remove(at: index)
        //songs.remove(at: index)
        PlaylistController.shared.saveToPersistenceStore()
        //saveToPersistenceStore()
    }
    
    //MARK - Persistence
    //copy and pasted into playlist controller
    
}
