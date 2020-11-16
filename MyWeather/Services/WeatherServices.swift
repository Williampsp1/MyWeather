//
//  File.swift
//  MyWeather
//
//  Created by William Lopez on 11/14/20.
//

import Foundation
import Combine

struct ApiClient {
    func make<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Error> {
        URLSession.shared
            .dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

struct WeatherServices {
    let apiClient: ApiClient  
    func weather(_ url: URL) -> AnyPublisher<WeatherResponse,Error> {
        let request = URLRequest(url: url)
        return apiClient.make(request)
    }
    
}

extension URL {
    static func urlForWeather(_ city: String) -> URL? {
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&id=524901&appid=1f3e31b4cdc18fd0785da5bd61117a14") else {
            return nil
        }
        
        return url
    }
}

extension String {
    
    func escaped() -> String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
}
//class WeatherServices {
//    static let key: String = "9a440d40c1mshcff3bdd3442b713p146b85jsnf3433ff4bea6"
//    static let path: String = "http://api.openweathermap.org/data/2.5/weather?q=omaha&id=524901&appid=1f3e31b4cdc18fd0785da5bd61117a14"
//}
