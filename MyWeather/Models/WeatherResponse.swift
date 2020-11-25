//
//  WeatherResponse.swift
//  MyWeather
//
//  Created by William Lopez on 11/14/20.
//

import Foundation
import SwiftUI

struct WeatherResponse: Codable,Identifiable {
    let id = UUID()
    let main: Temp
    let weather: [Weather]
    var city: String?
    var lat: Double?
    var lon: Double?
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: Weather.Icon
}
struct Temp: Codable {
    let temp: Double
    let pressure: Double
    let humidity: Double
    let temp_min: Double
    let temp_max: Double
}

extension Weather {
    enum Icon: String, Codable {
        case clearDay = "01d"
        case clearNight = "01n"
        case partyCloudyDay = "02d"
        case partyCloudyNight = "02n"
        case cloudy = "03d"
        case cloudyNight = "03n"
        case brokenCloud = "04d"
        case brokenCloudNight = "04n"
        case showerRain = "09d"
        case showerRainNight = "09n"
        case nightRain = "10n"
        case sunnyRain = "10d"
        case thunderStorm = "11d"
        case thunderStormNight = "11n"
        case snowDay = "13d"
        case snowNight = "13n"
        case mistDay = "50d"
        case mistNight = "50n"
        
        
        var image: Image {
            switch self {
            case .clearDay:
                return Image(systemName: "sun.max.fill")
            case .clearNight:
                return Image(systemName: "moon.stars.fill")
            case .partyCloudyDay:
                return Image(systemName: "cloud.sun.fill")
            case .partyCloudyNight:
                return Image(systemName: "cloud.moon.fill")
            case .cloudy:
                return Image(systemName: "cloud.fill")
            case .cloudyNight:
                return Image(systemName: "cloud.fill")
            case .brokenCloud:
                return Image(systemName: "cloud.fill")
            case .brokenCloudNight:
                return Image(systemName: "cloud.fill")
            case .showerRain:
                return Image(systemName: "cloud.heavyrain.fill")
            case .showerRainNight:
                return Image(systemName: "cloud.heavyrain.fill")
            case .nightRain:
                return Image(systemName: "cloud.moon.rain.fill")
            case .sunnyRain:
                return Image(systemName: "cloud.sun.rain.fill")
            case .thunderStorm:
                return Image(systemName: "cloud.bolt.rain.fill")
            case .thunderStormNight:
                return Image(systemName: "cloud.bolt.rain.fill")
            case .snowDay:
                return Image(systemName: "snow")
            case .snowNight:
                return Image(systemName: "snow")
            case .mistDay:
                return Image(systemName: "wind")
            case .mistNight:
                return Image(systemName: "wind")
            }
        }
    }
    
}
