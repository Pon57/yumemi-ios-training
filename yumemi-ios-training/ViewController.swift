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
        do {
            let weather: String = try YumemiWeather.fetchWeather(at: "tokyo")
            
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

