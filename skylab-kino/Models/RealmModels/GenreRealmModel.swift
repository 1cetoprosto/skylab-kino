//
//  GenreRealmModel.swift
//  Homework 9.2 @leosing
//
//  Created by Леонід Квіт on 09.01.2023.
//

import RealmSwift
import Realm

class GenreRealmModel: RealmSwiftObject {
    @Persisted(primaryKey: true) dynamic var id: Int
    @Persisted var name: String
    
    convenience init(tmdbModel: TMDBGenreModel) {
        self.init()
        self.id = tmdbModel.id
        self.name = tmdbModel.name
    }
}
