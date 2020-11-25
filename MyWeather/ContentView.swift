//
//  ContentView.swift
//  MyWeather
//
//  Created by William Lopez on 11/14/20.
//

import SwiftUI
import Combine
import MapKit

struct ContentView: View {
    @ObservedObject var weatherVM = WeatherViewModel()
    @ObservedObject private var cityFinder = CityFinder()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(weatherVM.weather) { weatherItem in
                    WeatherView(temp: weatherItem.main.temperature, city: weatherItem.city ?? "City error", weatherIcon: weatherItem.weather.first?.icon.image ?? Image(systemName: "bandage") )
                }.onDelete(perform: delete)
            }.listStyle(PlainListStyle())
            
            .navigationBarItems(leading: EditButton(), trailing: addButton)
            .navigationTitle(Text("My Weather"))
            
        }
        .environment(\.horizontalSizeClass, .compact)
    }
    
    private var addButton: some View {
        NavigationLink(
            destination: NewCity().environmentObject(weatherVM)
        ) {
            Image(systemName: "plus.circle.fill")
                .font(.title)
        }
    }
    
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            weatherVM.weather.remove(at: index)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


