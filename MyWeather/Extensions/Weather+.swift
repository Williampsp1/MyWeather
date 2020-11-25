//
//  Weather+.swift
//  MyWeather
//
//  Created by William Lopez on 11/20/20.
//

import Foundation

extension Temp {
    var temperature: String {
        
        String(format: "%.4F F", (temp * 9/5) - 459.67)
        
    }
    
    
}
