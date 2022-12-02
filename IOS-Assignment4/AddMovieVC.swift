//
//  AddMovieVC.swift
//  IOS-Assignment4
//
//  Created by Hannan Max on 2022-12-01.
//

import Foundation

import UIKit

class AddMovieVC: UIViewController {
    
    var movieList: MovieList!
    
    @IBOutlet weak var movieText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Adding title to ViewController
        title = "Add New Movies"
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Getting text from TextField and checking if not empty
        if !movieText.text!.isEmpty {
            let movieName = movieText.text!
            // Creating new movies to the Movies data model
            let movie = Movies(MovieName: movieName)
            // Adding movie to MovieList Array
            movieList.addMovie(movie: movie)
        }
    }
}
