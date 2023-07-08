//
//  RealmManager.swift
//  Homework 9.2 @leosing
//
//  Created by Леонід Квіт on 09.01.2023.
//

import RealmSwift
import Foundation

class RealmManager {
    static let shared: RealmManager = {
            do {
                return try RealmManager()
            } catch {
                fatalError("Error creating RealmManager: \(error)")
            }
        }()
    
    private let localRealm: Realm
    
    // MARK: - Lifecycle
    private init() throws {
        do {
            self.localRealm = try Realm()
        } catch {
            throw error
        }
    }

    func save<T: Object>(model object: T) {
        print("Realm is located at:", localRealm.configuration.fileURL!)
        do {
            try localRealm.write {
                localRealm.add(object, update: .all)
            }
        } catch {
            print(error)
        }
    }
    
    func delete<T: Object>(model object: T) {
        do {
            try localRealm.write {
                localRealm.delete(object)
            }
        } catch {
            print(error)
        }
    }
    
    func deleteAll() {
        do {
            try localRealm.write {
                localRealm.deleteAll()
            }
        } catch {
            print(error)
        }
    }
    
    func fetchMovies() -> [MovieRealmModel] {
        return Array(localRealm.objects(MovieRealmModel.self))
    }

    func fetchMovies(genreIDS: Int) -> [MovieRealmModel] {
        let predicate = NSPredicate(format: "genreIDS CONTAINS %@", NSNumber(value: genreIDS))
        
        return Array(localRealm.objects(MovieRealmModel.self).filter(predicate))
    }
    
    func fetchGenres() -> [GenreRealmModel] {
        return Array(localRealm.objects(GenreRealmModel.self))
    }
    
    func fetchMoviesByGenres() -> [(genre: String, items: [MovieRealmModel])] {
        
//        NetworkService.shared.fetchGenres { genre in
//            //жанри збережені в realm
//            for item in genre.genres {
//                let genreRealmModel = GenreRealmModel(tmdbModel: item)
//                RealmManager.shared.save(model: genreRealmModel)
//            }
//        }
        
        let genres = localRealm.objects(GenreRealmModel.self)
        
        var moviesByGenres: [String: [MovieRealmModel]] = [:]
        
        for genre in genres {
            let movies = fetchMovies(genreIDS: genre.id)
            moviesByGenres[genre.name] = Array(movies)
        }
        
        // Створюємо масив кортежів `(genre: String, items: [MovieRealmModel])` зі словника
        let moviesGroupedByGenres = moviesByGenres.map { (genre: $0.key, items: $0.value) }
        
        return moviesGroupedByGenres
    }
}
