//
//  NewCity.swift
//  MyWeather
//
//  Created by William Lopez on 11/20/20.
//

import SwiftUI
import CoreLocation

struct NewCity: View {
    @State private var search: String = ""
    @EnvironmentObject var weatherVM: WeatherViewModel
    @ObservedObject var cityFinder: CityFinder = CityFinder()
    @State var added: Bool = false
        
    var body: some View {
        List {
            Section {
                TextField("Enter a city", text:$search, onCommit:  {
                    self.cityFinder.search(self.search)
                })
            }
            
            Section {
                ForEach(cityFinder.results, id: \.self) { result in
                    Button(action: {
                        
                        self.addCity(from: result)
                        self.added = true
                        self.search = ""
                    }) {
                        Text(result)
                    }
                    .foregroundColor(.black)
                }
                
            }
        }
        .navigationBarTitle(Text("Add a City"))
        .listStyle(GroupedListStyle())
        
        if added {
            weatherInfoView.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.added.toggle()
                }
            }
        }
        
    }
    var weatherInfoView: some View {
        Group {
            if weatherVM.loadingState == .success{
                Text("Added!")
            } else if weatherVM.loadingState == .failed {
                Text("Could not load weather")
                
            }
        }
    }
    
    private func addCity(from result: String) {
        
        let address = result.split(separator: ",")
        var place: String = ""
        if address.count > 1 {
            place = address [0] + "," + address [1]
        } else {
            place = String(address [0])
        }
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(result) { (placemarks, error) in
            guard
                let placemark = placemarks?.first,
                let lat = placemark.location?.coordinate.latitude,
                let lon = placemark.location?.coordinate.longitude
            
            else {
                return
            }
            self.weatherVM.loadWeather(latitude: lat, longitude: lon, city: place)
            
        }
        
        
    }
    
    
}


