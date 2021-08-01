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
    
    @IBOutlet weak var maxTemp: UILabel!
    
    @IBOutlet weak var minTemp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reload(_ sender: Any) {
        let json = """
        {
            "area" : "tokyo",
            "date": "2020-04-01T12:00:00+09:00"
        }
        """
        
        do {
            let weatherJson: String = try YumemiWeather.fetchWeather(json)
            
            let jsonData = weatherJson.data(using: .utf8)
            
            let weather = try JSONDecoder().decode(WeatherInfo.self, from: jsonData!)
            
            minTemp.text = String(weather.minTemp)
            maxTemp.text = String(weather.maxTemp)
            weatherIcon.image = weather.getImage()
            weatherIcon.tintColor = weather.getTintColor()
        } catch {
            var alertTitle: String = ""
            let alertMessage: String = error.localizedDescription
            
            switch error {
            case YumemiWeatherError.invalidParameterError:
                alertTitle = "不正なパラメーター"
            case YumemiWeatherError.unknownError:
                alertTitle = "不明なエラー"
            default:
                alertTitle = "予期しないエラー"
            }
            
            let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "閉じる", style: .default))
            
            present(alert, animated: true, completion: nil)
        }
    }
}

