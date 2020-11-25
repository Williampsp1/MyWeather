//
//  URL+.swift
//  MyWeather
//
//  Created by William Lopez on 11/18/20.
//

import Foundation

public extension URL {
    init?(lat: Double, lon: Double) {
        guard let url = URL(string: "\(ApiClient.path)?lat=\(lat)&lon=\(lon)&id=524901&appid=1f3e31b4cdc18fd0785da5bd61117a14") else {
            return nil
        }
        
        self = url
    }
}
