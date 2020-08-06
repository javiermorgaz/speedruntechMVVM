//
//  RestClient.swift
//  speedruntechMVVM
//
//  Created by Jmorgaz on 28/07/2020.
//

import Foundation
import Combine

struct RestClient {

    func perform<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> T in
                let value = try decoder.decode(T.self, from: result.data)
                return value }
            .mapError { error in
                print(error)
                return error }
            .eraseToAnyPublisher()
    }
    
    func load(url: URL) -> AnyPublisher<Data, URLError> {
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .eraseToAnyPublisher()
    }
}
