//
//  CountryListVC.swift
//  WeatherToday
//
//  Created by 정재훈 on 26/07/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class CountryListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let customCellIdentifier: String = "countryListCell"
    var countries: [Country] = []
    
    @IBOutlet weak var tableViewCountryList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableViewCountryList.dataSource = self
        tableViewCountryList.delegate = self
        self.navigationItem.title = "세계 날씨"
        
        self.tableViewListLoad()
    }
    
    func tableViewListLoad() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }

        do {
            self.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }

        self.tableViewCountryList.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: CountryCustomTableViewCell = tableViewCountryList.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as? CountryCustomTableViewCell else {
            preconditionFailure("테이블 뷰 셀 가져오기 실패")
        }
        
        let country: Country = self.countries[indexPath.row]
        cell.countryAssetName = country.assetName
        cell.imageViewCountryFlag.image = UIImage(named: "flag_\(country.assetName)")
        cell.labelCountryName.text = country.koreanName
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let nextViewController: CityListVC = segue.destination as? CityListVC else {
            return
        }
        
        guard let cell: CountryCustomTableViewCell = sender as? CountryCustomTableViewCell else {
            return
        }
        
        nextViewController.countryName = cell.labelCountryName.text
        nextViewController.countryAssetName = cell.countryAssetName
    }
}
