//
//  WeatherResponse.swift
//  MyWeather
//
//  Created by William Lopez on 11/14/20.
//

import Foundation

struct WeatherResponse: Codable {
    let main: Weather
}

struct Weather: Codable {
    let temp: Double
    let pressure: Double
    let humidity: Double
    let temp_min: Double
    let temp_max: Double
}
