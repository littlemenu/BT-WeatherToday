//
//  CountryCustomTableViewCell.swift
//  WeatherToday
//
//  Created by 정재훈 on 29/07/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class CountryCustomTableViewCell: UITableViewCell {

    var countryAssetName: String?
    
    @IBOutlet weak var imageViewCountryFlag: UIImageView!
    @IBOutlet weak var labelCountryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // accessoryType = .disclosureIndicator
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
