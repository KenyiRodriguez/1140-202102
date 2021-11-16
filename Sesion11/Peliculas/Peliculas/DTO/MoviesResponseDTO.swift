//
//  MoviesResponseDTO.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 25/10/21.
//

import Foundation

struct PageMovieDTO: Decodable {
    
    let page: Int?
    let results: [MovieDTO]?
    let total_pages: Int?
    let total_results: Int?
}

struct MovieDTO: Decodable {
    
    let id: Int?
    let title: String?
    let release_date: String?
    let poster_path: String?
    let overview: String?
    let vote_average: Double?
}
