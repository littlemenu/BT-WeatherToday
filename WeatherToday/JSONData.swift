//
//  JSONData.swift
//  WeatherToday
//
//  Created by 정재훈 on 26/07/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import Foundation

struct Country: Codable {
    let koreanName: String
    let assetName: String
    
    enum CodingKeys: String, CodingKey {
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}

struct City: Codable {
    let cityName: String
    let state: Int
    let celsius: Double
    let rainfallProbability: Int
    
    var temperature: String {
        return "섭씨 \(self.celsius)도 / 화씨 \(self.celsius * 9/5 + 32)도"
    }
    
    enum CodingKeys: String, CodingKey {
        
        case cityName = "city_name"
        case state, celsius
        case rainfallProbability = "rainfall_probability"
    }
}

/*
 
 Country type
 {"korean_name":"한국","asset_name":"kr"}
 
 City type
 {
 "city_name":"파리",
 "state":10,
 "celsius":11.3,
 "rainfall_probability":90
 }
 
 */
