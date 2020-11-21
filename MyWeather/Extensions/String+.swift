//
//  String+.swift
//  MyWeather
//
//  Created by William Lopez on 11/18/20.
//

import Foundation

public extension String {
    var escaped: String? {
        self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
}
