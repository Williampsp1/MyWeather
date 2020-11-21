//
//  URLRequest+.swift
//  MyWeather
//
//  Created by William Lopez on 11/18/20.
//

import Foundation
import Combine

extension URLRequest {
    func make<T: Decodable>(decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Error> {
        URLSession.shared
            .dataTaskPublisher(for: self)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}


