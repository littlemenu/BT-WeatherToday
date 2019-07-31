//
//  WeatherInfoVC.swift
//  WeatherToday
//
//  Created by 정재훈 on 26/07/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class WeatherInfoVC: UIViewController {

    var cityName: String?
    var weatherState: Int?
    var temperature: String?
    var rainfallProbability: String?
    
    @IBOutlet weak var imageViewWeatherIcon: UIImageView!
    @IBOutlet weak var labelWeatherState: UILabel!
    @IBOutlet weak var labelTemperature: UILabel!
    @IBOutlet weak var labelRainfallProbability: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = cityName
        
        setIBOutlets()
    }
    
    func setIBOutlets() {
        if weatherState == 11 {
            imageViewWeatherIcon.image = UIImage(named: "sunny")
            labelWeatherState.text = "맑음"
        } else if weatherState == 12 {
            imageViewWeatherIcon.image = UIImage(named: "rainy")
            labelWeatherState.text = "비"
        } else {
            imageViewWeatherIcon.image = UIImage(named: "snowy")
            labelWeatherState.text = "눈"
        }
        labelTemperature.text = temperature
        labelRainfallProbability.text = rainfallProbability
    }
}
