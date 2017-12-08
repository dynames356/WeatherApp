//
//  ViewController.swift
//  WeatherApp
//
//  Created by PT Ionnex  on 08/12/2560 BE.
//  Copyright © 2560 BE Xendity. All rights reserved.
//

import UIKit
import SwiftSpinner

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var mainDate: UILabel!
    @IBOutlet weak var mainTemp: UILabel!
    @IBOutlet weak var mainWeather: UILabel!
    
    @IBOutlet weak var mainTable: UITableView!
    
    let cellIdentifier: String = "HistoryCell"
    var weather = Weather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTable.delegate = self
        mainTable.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        SwiftSpinner.show("Loading")
        APIAccess.AccessWeather { (output, error) in
            SwiftSpinner.hide()
            if error.isEmpty {
                self.title = "\(output.city), \(output.country)"
                self.mainDate.text = output.conditionDate
                self.mainTemp.text = output.conditionTemp
                self.mainWeather.text = output.conditionText
                
                self.weather = output
                self.mainTable.reloadData()
            } else {
                self.present(Util.showConventionalAlert(title: "API Error", message: error), animated: true, completion: nil)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.forecasts.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HistoryTableViewCell else {
            fatalError("Error Log: Cell cannot be dequeue for identifier \(cellIdentifier)")
        }
        
        let item = weather.forecasts[indexPath.row]
        cell.date.text = Util.convertDateTime(item.date, fromFormat: Util.dateFormat, toFormat: Util.dateDayFormat)
        cell.temperature.text = "\(item.low) - \(item.high)"
        cell.weather.text = item.text
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

