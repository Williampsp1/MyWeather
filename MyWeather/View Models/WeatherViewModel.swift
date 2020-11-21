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
    case loading
    case failed
}

class WeatherViewModel: ObservableObject {
    deinit {
        task?.cancel()
    }
    
    private var task: AnyCancellable?
    let weatherProvider = WeatherServices()
    @Published var weather: [WeatherResponse] = []
  //  @Published var weatherData: WeatherResponse?
    @Published var loadingState: LoadingState = .none
    
//    var temperature: String {
//        guard let temp = weather.first?.main.temp else {
//            return "N/A"
//        }
//        
//        return String(format: "%.0F F", temp.farenheit)
//
//    }
    
    func loadWeather(city: String) {
        
        guard let cityEscaped = city.escaped else {
            print("Bad city")
            self.loadingState = .failed
            return
        }
        guard let url = URL(urlForCity: cityEscaped) else {
            print("Bad URL")
            self.loadingState = .failed
            return 
        }
        
        loadingState = .loading
        
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
                
                
                
                if let index = self.weather.firstIndex(where: {$0.city == city}){
                    self.weather[index] = weather
                } else {
                    self.weather.append(weather)
                }
                print(weather)
            })
    }
}
