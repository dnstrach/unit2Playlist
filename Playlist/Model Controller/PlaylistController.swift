//
//  PlaylistController.swift
//  Playlist
//
//  Created by Dominique Strachan on 12/20/22.
//

import Foundation

class PlaylistController {
    
    //shared instance
    static let shared = PlaylistController()
    
    //source of truth
    var playlists: [Playlist] = []
    
    //CRUD
    //note: updating songs in playlist not the playlist name
    
    //create
    func createPlaylist(playlistName: String) {
        let newPlaylist = Playlist(playlistName: playlistName)
        playlists.append(newPlaylist)
        
        //save
        saveToPersistenceStore()
    }
    
    //delete
    //remove playlist at particular index
    //to use firstIndex of need to make playlist model equatable
    func deletePlaylist(playlist: Playlist) {
        guard let index = playlists.firstIndex(of: playlist) else { return }
        playlists.remove(at: index)
        
        //save
        saveToPersistenceStore()
    }
    
    //Persistence Store
    //finding available URL saved in user's document directory and domain mask
    func persistentStore() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("Playlist.json")
        return fileURL
    }
    
    //Save
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(playlists)
            try data.write(to: persistentStore())
        } catch {
            print("We had an error saving to our persistence store")
            print(error)
            print(error.localizedDescription)
        }
    }
    
    //Load
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: persistentStore())
            playlists = try JSONDecoder().decode([Playlist].self, from: data)
        } catch {
            print("We had an error loading our data from the persistence store.")
            print(error)
            print(error.localizedDescription)
        }
    }
}
