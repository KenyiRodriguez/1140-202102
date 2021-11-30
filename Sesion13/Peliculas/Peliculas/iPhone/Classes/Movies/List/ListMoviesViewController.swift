//
//  ListMoviesViewController.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 8/11/21.
//

import UIKit

class ListMoviesViewController: UIViewController {
    
    @IBOutlet private weak var clvMovies: UICollectionView!
    
    lazy var listAdapter = ListMovieAdapter(controller: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listAdapter.setCollectionView(self.clvMovies)
        self.getAllMovies()
    }
    
    private func getAllMovies() {
        
        let webServices = MovieWS()
        webServices.getAllMovies { arrayMovieDTO in
            
            self.listAdapter.arrayMovies = arrayMovieDTO.toMovies
            self.clvMovies.reloadData()
        }
    }
    
    func goToMovieDetail(_ objMovie: Movie) {
        self.performSegue(withIdentifier: "MovieDetailViewController", sender: objMovie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let controller = segue.destination as? MovieDetailViewController, let objMovie = sender as? Movie {
            controller.objMovie = objMovie
        }
    }
}
