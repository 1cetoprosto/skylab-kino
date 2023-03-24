//
//  NetworkManager.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 04.03.2023.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseUrl = "https://api.themoviedb.org/3"
    private let apiKey = "f6454f589d9354f69c4998388e8a31fd"
    
    func request<T: Codable>(_ endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        let url = "\(baseUrl)\(endpoint.path)"
        
        var parameters = endpoint.parameters ?? [:]
        parameters["api_key"] = apiKey
        parameters["language"] = "uk"
        
        AF.request(url, method: endpoint.method, parameters: parameters, encoding: endpoint.encoding, headers: endpoint.headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
