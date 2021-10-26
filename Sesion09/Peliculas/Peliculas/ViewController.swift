//
//  ViewController.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 25/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let movieWS = MovieWS()
        movieWS.getAllMovies()
    }


}

