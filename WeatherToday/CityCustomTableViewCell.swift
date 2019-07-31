//
//  CityCustomTableViewCell.swift
//  WeatherToday
//
//  Created by 정재훈 on 29/07/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class CityCustomTableViewCell: UITableViewCell {

    var weatherState: Int?
    
    @IBOutlet weak var imageViewWeatherIcon: UIImageView!
    @IBOutlet weak var labelCityName: UILabel!
    @IBOutlet weak var labelTemperature: UILabel!
    @IBOutlet weak var labelRainfallProbability: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //accessoryType = .disclosureIndicator
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
