//
//  WeatherResponse.swift
//  MyWeather
//
//  Created by William Lopez on 11/14/20.
//

import Foundation

struct WeatherResponse: Codable,Identifiable {
    let id = UUID()
    let main: Weather
    var city: String?
}

struct Weather: Codable {
    let temp: Double
    let pressure: Double
    let humidity: Double
    let temp_min: Double
    let temp_max: Double
}

extension Weather {
    var temperature: String {
        
        String(format: "%.4F F", (temp * 9/5) - 459.67)
        
    }
}


