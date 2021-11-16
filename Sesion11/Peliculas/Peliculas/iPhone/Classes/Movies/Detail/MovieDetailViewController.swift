//
//  MovieDetailViewController.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 8/11/21.
//

import UIKit
import Alamofire

class MovieDetailViewController: UIViewController {
    
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var lblReleaseDate: UILabel!
    @IBOutlet private weak var lblOverview: UILabel!
    @IBOutlet private weak var imgMovie: UIImageView!
    @IBOutlet private weak var imgBackground: UIImageView!
    @IBOutlet private var arrayStars: [UIImageView]!
    
    var objMovie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupStyle()
        self.updateData()
    }
    
    func setupStyle() {
        self.imgMovie.layer.cornerRadius = 10
    }

    func updateData() {

        self.lblName.text = self.objMovie.name
        self.lblReleaseDate.text = self.objMovie.releaseDateFormat
        self.lblOverview.text = self.objMovie.overview
        
        for (index, img) in self.arrayStars.enumerated() {
            img.image = index < self.objMovie.voteAverage ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        }
        
        let request = AF.request(self.objMovie.urlImage)
        request.response { dataResponse in
            
            guard let data = dataResponse.data else {
                self.imgMovie.image = nil
                self.imgBackground.image = nil
                return
            }
            
            let image = UIImage(data: data)
            self.imgMovie.image = image
            self.imgBackground.image = image
        }
    }
}
