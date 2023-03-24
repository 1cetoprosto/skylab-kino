//
//  Endpoint.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 04.03.2023.
//

import Alamofire

enum Endpoint {
    case genre
    case discoverMovies(page: Int, genreID: Int)
    case popularMovies(page: Int)
    case movieDetails(id: Int)
    
    var path: String {
        switch self {
        case .genre:
            return "/genre/movie/list"
        case .discoverMovies:
            return "/discover/movie"
        case .popularMovies:
            return "/movie/popular"
        case .movieDetails(let id):
            return "/movie/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .genre, .discoverMovies, .popularMovies, .movieDetails:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .genre:
            return nil
        case .discoverMovies(let page, let genreID):
            return ["page": page, "with_genres": genreID, "sort_by": "popularity.desc"]
        case .popularMovies(let page):
            return ["page": page]
        case .movieDetails:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .genre, .discoverMovies, .popularMovies, .movieDetails:
            return URLEncoding.default
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
