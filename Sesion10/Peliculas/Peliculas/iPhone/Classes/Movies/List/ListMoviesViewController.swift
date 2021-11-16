//
//  ListMoviesViewController.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 8/11/21.
//

import UIKit

class ListMoviesViewController: UIViewController {
    
    @IBOutlet private weak var tlbMovies: UITableView!
    
    private var arrayMovies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getAllMovies()
    }
    
    private func getAllMovies() {
        
        let webServices = MovieWS()
        webServices.getAllMovies { arrayMovieDTO in
            
            self.arrayMovies = arrayMovieDTO.toMovies
            self.tlbMovies.reloadData()
        }
    }
}

extension ListMoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return MovieTableViewCell.createInTableView(tableView, indexPath: indexPath, movie: self.arrayMovies[indexPath.row])
    }
}
