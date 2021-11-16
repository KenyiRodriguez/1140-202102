//
//  MoviesWS.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 25/10/21.
//

import Foundation
import Alamofire
import UIKit

struct MovieWS {
    
    typealias MoviesDTOCompletionHandler = (_ arrayMovieDTO: [MovieDTO]) -> Void
    
    func getAllMovies(_ completionHandler: @escaping MoviesDTOCompletionHandler) {
        
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=176de15e8c8523a92ff640f432966c9c"
        let request = AF.request(urlString)
        
        request.response { dataResponse in
            
            guard let data = dataResponse.data else {
                print("Ocurrio un error en el servicio")
                completionHandler([])
                return
            }
            
            let decoder = JSONDecoder()
            let page = try? decoder.decode(PageMovieDTO.self, from: data)
            completionHandler(page?.results ?? [])
        }
    }
}
