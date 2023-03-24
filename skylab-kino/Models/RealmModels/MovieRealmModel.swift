//
//  MovieRealmModel.swift
//  Homework 9.2 @leosing
//
//  Created by Леонід Квіт on 09.01.2023.
//

import RealmSwift
import Realm
import Foundation

class MovieRealmModel: RealmSwiftObject {
    @Persisted var adult: Bool
    @Persisted var backdropPath: String
    @Persisted var genreIDS: List<Int>
    @Persisted(primaryKey: true) dynamic var id: Int
    @Persisted var originalLanguage: String
    @Persisted var originalTitle: String
    @Persisted var overview: String
    @Persisted var popularity: Double
    @Persisted var posterPath: String
    @Persisted var releaseDate: String
    @Persisted var title: String
    @Persisted var video: Bool
    @Persisted var voteAverage: Double
    @Persisted var voteCount: Int
    
    convenience init(tmdbModel: TMDBMovieModel) {
        self.init()
        self.adult = tmdbModel.adult
        self.backdropPath = tmdbModel.backdropPath
        self.genreIDS.append(objectsIn: tmdbModel.genreIDS.map{$0})
        self.id = tmdbModel.id
        self.originalLanguage = tmdbModel.originalLanguage
        self.originalTitle = tmdbModel.originalTitle
        self.overview = tmdbModel.overview
        self.popularity = tmdbModel.popularity
        self.posterPath = tmdbModel.posterPath
        self.releaseDate = tmdbModel.releaseDate
        self.title = tmdbModel.title
        self.video = tmdbModel.video
        self.voteAverage = tmdbModel.voteAverage
        self.voteCount = tmdbModel.voteCount
    }
}

