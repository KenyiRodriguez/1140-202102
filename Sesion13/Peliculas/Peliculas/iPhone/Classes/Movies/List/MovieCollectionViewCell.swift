//
//  MovieTableViewCell.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 8/11/21.
//

import UIKit
import Alamofire

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var imgMovie: UIImageView!
    
    func updateData(_ movie: Movie) {
        
        self.animateAppear()
        self.lblName.text = movie.name

        let request = AF.request(movie.urlImage)
        request.response { dataResponse in
            
            guard let data = dataResponse.data else {
                self.imgMovie.image = nil
                return
            }
            
            let image = UIImage(data: data)
            self.imgMovie.image = image
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.imgMovie.layer.cornerRadius = 10
    }
    
    private func animateAppear() {
        
        self.alpha = 0
        self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        let randomDelay = CGFloat.random(in: 0.3...(0.8))
        
        UIView.animate(withDuration: 0.4, delay: randomDelay, options: [.curveEaseInOut], animations: {
            
            self.alpha = 1
            self.transform = .identity
            
        }, completion: nil)
    }
}

extension MovieCollectionViewCell {
    
    class func createInCollectionView(_ collectionView: UICollectionView, indexPath: IndexPath, movie: Movie) -> MovieCollectionViewCell {
        
        let cellIdentifier = "MovieCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? MovieCollectionViewCell
        cell?.updateData(movie)
        
        return cell ?? MovieCollectionViewCell()
    }
}

