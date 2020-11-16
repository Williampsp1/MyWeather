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
    
    var bag = [AnyCancellable]()
    let weatherProvider = WeatherServices(apiClient: ApiClient())
    @Published private var weather: WeatherResponse?
    @Published var loadingState: LoadingState = .none
   
    var temp: Int {
        guard let temp = weather?.main.temp else {
            return 0
        }
        
        return Int((temp * 9/5) - 459.67)
    }
    
    func loadWeather(city: String) {
        
        guard let city = city.escaped() else {
            print("Bad city")
            return
        }
        guard let url = URL.urlForWeather(city) else {
            print("Bad URL")
            return 
        }
        
        loadingState = .loading
 
        weatherProvider.weather(url)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.loadingState = .success
                case .failure:
                    self.loadingState = .failed
                }
            }, receiveValue: {(data) in
                
                self.weather = data 
               
                print(data)
        }).store(in: &bag)
    }
}
