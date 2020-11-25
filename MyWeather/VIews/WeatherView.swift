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
    let weatherIcon: Image
    
    var body: some View {
        HStack{
            Text(city).font(.title)
            Spacer()
            Text(temp).font(.title)
            weatherIcon.resizable().scaledToFit().frame(width:35,height: 35)
        }.frame( height: 50)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(temp: "45", city: "omaha", weatherIcon: Image(systemName: "cloud"))
    }
}
