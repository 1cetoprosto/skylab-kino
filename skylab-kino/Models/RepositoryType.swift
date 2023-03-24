//
//  RepositoryType.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 03.03.2023.
//

import Foundation

protocol Repository {
    associatedtype T
    
    func get(id: Int, completionHandler: (T?, Error?) -> Void)
    func list(completionHandler: ([T]?, Error?) -> Void)
    func add(_ item: T, completionHandler: (Error?) -> Void)
    func delete(_ item: T, completionHandler: (Error?) -> Void)
    func edit(_ item: T, completionHandler: (Error?) -> Void)
}

//protocol CombineRepository {
//    associatedtype T
//
//    func get(id: Int) -> AnyPublisher<T, Error>
//    func list() -> AnyPublisher<[T], Error>
//    func add(_ item: T) -> AnyPublisher<Void, Error>
//    func delete(_ item: T) -> AnyPublisher<Void, Error>
//    func edit(_ item: T) -> AnyPublisher<Void, Error>
//}
