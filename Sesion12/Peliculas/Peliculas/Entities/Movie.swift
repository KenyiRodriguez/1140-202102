//
//  Movie.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 8/11/21.
//

import Foundation

struct Movie {
    
    let id: Int
    let name: String
    private let releaseDate: Date?
    private let posterPath: String
    let overview: String
    let voteAverage: Int
    
    var releaseDateFormat: String {
        return self.releaseDate?.toString ?? "Proximamente..."
    }
    
    var urlImage: String {
        return "https://image.tmdb.org/t/p/w500" + self.posterPath
    }
    
    init(_ dto: MovieDTO) {
        
        self.id = dto.id ?? 0
        self.name = dto.title ?? "--"
        self.posterPath = dto.poster_path ?? ""
        self.overview = dto.overview ?? ""
        self.voteAverage = Int(dto.vote_average ?? 0)
        self.releaseDate = dto.release_date?.toDate
    }
}

extension MovieDTO {
    var toMovie: Movie {
        return Movie(self)
    }
}

extension Array where Element == MovieDTO {
    
    var toMovies: [Movie] {
        return self.map({ $0.toMovie })
    }
    
//    var toMovies: [Movie] {
//
//        var arrayMovies = [Movie]()
//
//        for dto in self {
//            arrayMovies.append(dto.toMovie)
//        }
//
//        return arrayMovies
//    }
}
