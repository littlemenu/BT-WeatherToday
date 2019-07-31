//
//  CityListVC.swift
//  WeatherToday
//
//  Created by 정재훈 on 26/07/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class CityListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let customCellIndentifier: String = "cityListCell"
    var countryName: String?
    var countryAssetName: String?
    var cities: [City] = []
    
    @IBOutlet weak var tableViewCityList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = countryName
        
        tableViewCityList.dataSource = self
        tableViewCityList.delegate = self
        
        self.tableViewListLoad()
    }
    
    func tableViewListLoad() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        guard let countryAssetName: String = self.countryAssetName else {
            print("오류: 선택된 나라가 없습니다!")
            return
        }
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: countryAssetName) else {
            return
        }
        
        do {
            self.cities = try jsonDecoder.decode([City].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.tableViewCityList.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: CityCustomTableViewCell = tableViewCityList.dequeueReusableCell(withIdentifier: customCellIndentifier, for: indexPath) as? CityCustomTableViewCell else {
            preconditionFailure("테이블 뷰 셀 가져오기 실패")
        }
        
        let city: City = self.cities[indexPath.row]
        
        if city.state == 11 {
            cell.imageViewWeatherIcon.image = UIImage(named: "sunny")
        } else if city.state == 12 {
            cell.imageViewWeatherIcon.image = UIImage(named: "rainy")
        } else {
            cell.imageViewWeatherIcon.image = UIImage(named: "snowy")
        }
        cell.weatherState = city.state
        
        cell.labelCityName.text = city.cityName
        cell.labelTemperature.text = city.temperature
        cell.labelRainfallProbability.text = "강수 확률 \(city.rainfallProbability)%"
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let nextViewController: WeatherInfoVC = segue.destination as? WeatherInfoVC else {
            return
        }
        
        guard let cell: CityCustomTableViewCell = sender as? CityCustomTableViewCell else {
            return
        }
        
        guard let weatherState = cell.weatherState else {
            return
        }
        
        nextViewController.cityName = cell.labelCityName.text
        nextViewController.weatherState = weatherState
        nextViewController.temperature = cell.labelTemperature.text
        nextViewController.rainfallProbability = cell.labelRainfallProbability.text
    }
}
