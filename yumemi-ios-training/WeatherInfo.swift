//
//  Weather.swift
//  yumemi-ios-training
//
//  Created by Pon on 2021/08/01.
//

import UIKit
import Foundation

struct WeatherInfo: Decodable {
    enum Weather: String, Decodable {
        case Sunny = "sunny"
        case Cloudy = "cloudy"
        case Rainy = "rainy"
    }
    let weather: Weather
    
    let minTemp: Int
    let maxTemp: Int
    let date: String
    
    private enum CodingKeys : String, CodingKey {
        case weather
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case date
    }
    
    public func getTintColor() -> UIColor {
        switch self.weather {
        case Weather.Sunny:
            return .red
        case Weather.Cloudy:
            return .gray
        case Weather.Rainy:
            return .blue
        }
    }
    
    public func getImage() -> UIImage {
        switch self.weather {
        case Weather.Sunny:
            return UIImage(named: "Sunny")!
        case Weather.Cloudy:
            return UIImage(named: "Cloudy")!
        case Weather.Rainy:
            return UIImage(named: "Rainy")!
        }
    }
}
