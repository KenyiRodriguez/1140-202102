//
//  ListMovieAdapter.swift
//  Peliculas
//
//  Created by Angel Kenyi Rodriguez Vergara on 22/11/21.
//

import UIKit

class ListMovieAdapter: NSObject {
    
    var arrayMovies = [Movie]()
    
    private unowned let controller: ListMoviesViewController
    
    init(controller: ListMoviesViewController) {
        self.controller = controller
    }
    
    func setTableView(_ tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ListMovieAdapter: UITableViewDataSource {
    
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

extension ListMovieAdapter: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let objMovie = self.arrayMovies[indexPath.row]
        self.controller.goToMovieDetail(objMovie)
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
            self.controller.goToMovieDetail(objMovie)
        }
        seeDetailAction.backgroundColor = .systemIndigo
        seeDetailAction.image = UIImage(systemName: "doc.richtext")


        let swipActions = UISwipeActionsConfiguration(actions: [deleteAction, seeDetailAction])
        return swipActions
    }
}
