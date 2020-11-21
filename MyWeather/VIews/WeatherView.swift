//
//  WeatherView.swift
//  MyWeather
//
//  Created by William Lopez on 11/18/20.
//

import SwiftUI

struct WeatherView: View {
        let temp: String
        let city: String
        
        var body: some View {
            Text("Weather for \(city) is \(temp)")
        }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(temp: "45", city: "omaha")
    }
}
