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
            TextField("Enter a city", text: $city, onEditingChanged:{ _ in }, onCommit: {
                weatherVM.loadWeather(city: city)
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            
            Spacer()
            List{
                ForEach(weatherVM.weather) { weatherItem in
                    WeatherView(temp: weatherItem.main.temperature, city: weatherItem.city ?? "City error" )
                }
            }
            //  weatherInfoView
            
        }.padding()
        
    }
    
    //    var weatherInfoView: some View {
    //        Group {
    //            if weatherVM.loadingState == .loading {
    //                Text("Loading...")
    //            }
    //            else if weatherVM.loadingState == .success{
    //                WeatherView(temp: weatherVM.temperature, city: city)
    //                
    //            } else if weatherVM.loadingState == .failed {
    //                Text("Could not load weather")
    //            }
    //        }
    //    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


