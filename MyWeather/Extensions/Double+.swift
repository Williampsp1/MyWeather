//
//  Farenheit.swift
//  MyWeather
//
//  Created by William Lopez on 11/19/20.
//

import Foundation

public extension Double {
    var farenheit: Double {
        let temperature = Measurement<UnitTemperature>(value: self, unit: .kelvin)
        
        let convertedTemperature = temperature.converted(to: .fahrenheit)
        return convertedTemperature.value
    }
}
