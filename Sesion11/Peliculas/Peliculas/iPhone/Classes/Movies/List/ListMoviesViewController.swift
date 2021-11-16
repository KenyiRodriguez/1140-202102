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
    
    @IBAction private func clickBtnEdit(_ sender: Any) {
        self.tlbMovies.beginUpdates()
        self.tlbMovies.isEditing = !self.tlbMovies.isEditing
        self.tlbMovies.endUpdates()
    }
    
    private func getAllMovies() {
        
        let webServices = MovieWS()
        webServices.getAllMovies { arrayMovieDTO in
            
            self.arrayMovies = arrayMovieDTO.toMovies
            self.tlbMovies.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let controller = segue.destination as? MovieDetailViewController, let objMovie = sender as? Movie {
            controller.objMovie = objMovie
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
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let objMovie = self.arrayMovies[sourceIndexPath.row]
        
        self.arrayMovies.remove(at: sourceIndexPath.row)
        self.arrayMovies.insert(objMovie, at: destinationIndexPath.row)
    }
}

extension ListMoviesViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let objMovie = self.arrayMovies[indexPath.row]
        self.performSegue(withIdentifier: "MovieDetailViewController", sender: objMovie)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .destructive, title: "Eliminar") { _, _, _ in
            self.arrayMovies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            //Consumir servicio en el servidor
        }
        deleteAction.image = UIImage(systemName: "trash")


        let seeDetailAction = UIContextualAction(style: .normal, title: "Ver detalle") { _, _, _ in
            let objMovie = self.arrayMovies[indexPath.row]
            self.performSegue(withIdentifier: "MovieDetailViewController", sender: objMovie)
        }
        seeDetailAction.backgroundColor = .systemIndigo
        seeDetailAction.image = UIImage(systemName: "doc.richtext")


        let swipActions = UISwipeActionsConfiguration(actions: [deleteAction, seeDetailAction])
        return swipActions
    }
}
