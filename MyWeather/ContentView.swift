//
//  ContentView.swift
//  MyWeather
//
//  Created by William Lopez on 11/14/20.
//

import SwiftUI
import Combine


struct ContentView: View {
    @ObservedObject private var weatherVM = WeatherViewModel()
    @State private var city: String = ""
    
    var body: some View {
        VStack{
            TextField("Enter a city", text: self.$city, onEditingChanged:{ _ in }, onCommit: {
                self.weatherVM.loadWeather(city: self.city)
            }).textFieldStyle(RoundedBorderTextFieldStyle())
    
                
            Spacer()
            if self.weatherVM.loadingState == .loading {
                Text("Loading...")
            }
            else if self.weatherVM.loadingState == .success{
                WeatherView(temp: self.weatherVM.temp, city: self.city)
                    
            } else if self.weatherVM.loadingState == .failed {
                Text("Could not load weather")
            }
            
        }.padding()
        
            }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherView: View {
    let temp: Int
    let city: String
    
    var body: some View {
        Text("Weather for \(city) is \(temp)")
    }
}

