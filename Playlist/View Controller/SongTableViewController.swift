//
//  SongTableViewController.swift
//  Playlist
//
//  Created by Dominique Strachan on 12/19/22.
//

import UIKit

class SongTableViewController: UITableViewController {

    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    
    //MARK - Properties
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //SongController.shared.loadFromPersistenceStore()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        //guard protects from optionals - input strings are optional
        //text field can not be optional/nil to add a song
        //have to return at end of guard statement..if conditions are not met bail from function
        //!songTitle.isEmpty !artistName.isEmpty preventing an added empty string
        //referencing text from text in employee text field outlet
        guard let songTitle = songTitleTextField.text,
              let artistName = artistNameTextField.text,
              !songTitle.isEmpty,
              !artistName.isEmpty,
              let playlist = playlist else {return}
        SongController.createSong(title: songTitle, artist: artistName, playlist: playlist)
        //SongController.shared.createSong(title: songTitle, artist: artistName)
        
        songTitleTextField.text = ""
        artistNameTextField.text = ""
        
        //reloads data to add new cell to row
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
//remove function because do not need number of rows will be creating rows with each song input
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
    
    //can't hardcode number because rows will change depending on song input
    //have to create shared instance in SongController or else will be managing every instance for a song between rows and cells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //no good because does not account for instances on left and right handside?
        //let songController = SongController()
        //songCont.songs
        //return
        
        //shared instance - need single instance of song controller that can be accessed by all functions
        //return SongController.shared.songs.count
        
        return playlist?.songs.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //create songCell identifier in main
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)

        guard let playlist = playlist else { return cell }
        
        //subscripting into array to match rows and cells with each song's index in array
        //my playlist has class name SongTableViewController
        //let song = SongController.shared.songs[indexPath.row]
        let song = playlist.songs[indexPath.row]
        
        cell.textLabel?.text = song.title
        cell.detailTextLabel?.text = song.artist
        
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlist else { return }
            // Delete the row from the data source
            //let songToDelete = SongController.shared.songs[indexPath.row]
            let songToDelete = playlist.songs[indexPath.row]
            //SongController.shared.deleteSong(song: songToDelete)
            SongController.deleteSong(song: songToDelete, playlist: playlist)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            //with break points can check to see that deleteSong function ran first
            //in terminal po SongController.shared.songs.count // 0 
        }    
    }
}
