//
//  ViewController.swift
//  yumemi-ios-training
//
//  Created by Pon on 2021/07/31.
//

import UIKit
import YumemiWeather

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reloadWeatherIcon(_ sender: Any) {
        let weather: String = YumemiWeather.fetchWeather()
        
        switch weather {
        case "sunny":
            weatherIcon.tintColor = UIColor.red
            weatherIcon.image = UIImage(named: "Sunny")
        case "cloudy":
            weatherIcon.tintColor = UIColor.gray
            weatherIcon.image = UIImage(named: "Cloudy")
        case "rainy":
            weatherIcon.tintColor = UIColor.blue
            weatherIcon.image = UIImage(named: "Rainy")
        default:
            print("ないよ")
        }
    }
}

