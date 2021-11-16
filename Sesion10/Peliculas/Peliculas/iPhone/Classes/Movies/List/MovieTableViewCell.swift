//
//  MovieTableViewCell.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 8/11/21.
//

import UIKit
import Alamofire

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var lblReleaseDate: UILabel!
    @IBOutlet private weak var imgMovie: UIImageView!
    
    func updateData(_ movie: Movie) {
        
        self.animateAppear()
        self.lblName.text = movie.name
        self.lblReleaseDate.text = movie.releaseDateFormat
        
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
        self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8).translatedBy(x: -150, y: 0)
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut], animations: {
            
            self.alpha = 1
            self.transform = .identity
            
        }, completion: nil)
    }
}

extension MovieTableViewCell {
    
    class func createInTableView(_ tableView: UITableView, indexPath: IndexPath, movie: Movie) -> MovieTableViewCell {
        
        let cellIdentifier = "MovieTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MovieTableViewCell
        cell?.updateData(movie)
        
        return cell ?? MovieTableViewCell()
    }
}

