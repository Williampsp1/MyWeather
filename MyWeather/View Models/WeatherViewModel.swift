//
//  WeatherViewModel.swift
//  MyWeather
//
//  Created by William Lopez on 11/14/20.
//

import Foundation
import Combine

enum LoadingState {
    case none
    case success
    case failed
}

class WeatherViewModel: ObservableObject {
    deinit {
        task?.cancel()
    }
    
    private var task: AnyCancellable?
    let weatherProvider = WeatherServices()
    @Published var weather: [WeatherResponse] = []
    @Published var loadingState: LoadingState = .none
    
    func loadWeather(latitude: Double,longitude: Double, city: String) {
        
        guard let url = URL(lat: latitude, lon: longitude) else {
            print("Bad URL")
            self.loadingState = .failed
            return 
        }
        
        task = weatherProvider.weather(url)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.loadingState = .success
                case .failure:
                    self.loadingState = .failed
                }
            }, receiveValue: {(data) in
                
                guard var weather = data else {
                    return
                }
                weather.city = city
                weather.lat = latitude
                weather.lon = longitude
                
                if let index = self.weather.firstIndex(where: {$0.lat == latitude && $0.lon == longitude}){
                    self.weather[index] = weather
                } else {
                    self.weather.append(weather)
                }
                print(weather)
            })
    }
}
