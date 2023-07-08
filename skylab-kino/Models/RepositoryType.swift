//
//  RepositoryType.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 03.03.2023.
//

import Foundation

protocol Repository {
    associatedtype Item
    
    func get(id: Int, completionHandler: (Item?, Error?) -> Void)
    func list(completionHandler: ([Item]?, Error?) -> Void)
    func add(_ item: Item, completionHandler: (Error?) -> Void)
    func delete(_ item: Item, completionHandler: (Error?) -> Void)
    func edit(_ item: Item, completionHandler: (Error?) -> Void)
}

// protocol CombineRepository {
//    associatedtype T
//
//    func get(id: Int) -> AnyPublisher<T, Error>
//    func list() -> AnyPublisher<[T], Error>
//    func add(_ item: T) -> AnyPublisher<Void, Error>
//    func delete(_ item: T) -> AnyPublisher<Void, Error>
//    func edit(_ item: T) -> AnyPublisher<Void, Error>
// }
