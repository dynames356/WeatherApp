//
//  Util.swift
//  WeatherApp
//
//  Created by PT Ionnex  on 08/12/2560 BE.
//  Copyright © 2560 BE Xendity. All rights reserved.
//

import UIKit

class Util {
    static let APIDatetimeFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    static let datetimeFormat = "EEE, dd MMM yyyy hh:mm a zzz"
    static let dateDayFormat = "dd MMM yyyy, EEE"
    static let dateFormat = "dd MMM yyyy"
    
    static func convertDateTime(_ inputDate: String, fromFormat: String, toFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        dateFormatter.dateFormat = fromFormat
        
        if let date = dateFormatter.date(from: inputDate) {
            dateFormatter.dateFormat = toFormat
            return dateFormatter.string(from: date)
        }
        
        return ""
    }
    
    static func showConventionalAlert(title: String, message: String) -> UIAlertController {
        let alert: UIAlertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            alert!.dismiss(animated: true, completion: nil)
        }))
        
        return alert
    }
}
