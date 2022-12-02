//
//  MovieListTableViewController.swift
//  IOS-Assignment4
//
//  Created by Hannan Max on 2022-12-01.
//

import Foundation
import UIKit

class MovieListTableViewController: UITableViewController {
    
    let movieList = MovieList(autofil: true)
    var movieText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Adding the title into the main table view
        title = "Movies"
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Returning the movie count
        return movieList.movieList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        cell.textLabel?.text = movieList.movieList[indexPath.row]
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Reloading the table view to add a new movie and refresh it
        tableView.reloadData()
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Deleting row
            movieList.movieList.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Inserting new row
            movieList.movieList.insert(movieText, at: 0)
        }
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
        let item = movieList.movieList[fromIndexPath.row]
        movieList.movieList.remove(at: fromIndexPath.row)
        movieList.movieList.insert(item, at: fromIndexPath.row)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Retriving data from added movie
        let destination = segue.destination as! AddMovieVC
        destination.movieList = movieList
    }
}
