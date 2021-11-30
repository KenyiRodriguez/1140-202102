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
    
    func setCollectionView(_ collectionView: UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ListMovieAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        MovieCollectionViewCell.createInCollectionView(collectionView, indexPath: indexPath, movie: self.arrayMovies[indexPath.row])
    }
}

extension ListMovieAdapter: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let objMovie = self.arrayMovies[indexPath.row]
        self.controller.goToMovieDetail(objMovie)
    }
}

extension ListMovieAdapter: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionWidth = collectionView.frame.width
        let numberOfColumns: CGFloat = collectionWidth > 320 ? 3 : 2
        
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let collectionInset = layout?.sectionInset ?? .zero
        let cellSpace = layout?.minimumInteritemSpacing ?? 0
        
        let cellsSpace = (numberOfColumns - 1) * cellSpace
        let avaibleWidth = collectionWidth - collectionInset.left - collectionInset.right - cellsSpace
        
        let cellWidth = (avaibleWidth / numberOfColumns).rounded(.down)
        let cellHeight = cellWidth * 1.8 / 1
        
        let newSize = CGSize(width: cellWidth, height: cellHeight)
        return newSize
    }
}
