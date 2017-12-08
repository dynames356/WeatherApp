//
//  Forecast.swift
//  WeatherApp
//
//  Created by PT Ionnex  on 08/12/2560 BE.
//  Copyright © 2560 BE Xendity. All rights reserved.
//

import Foundation
import ObjectMapper

class Forecast: Mappable {
    var date: String = ""
    var low: String = ""
    var high: String = ""
    var text: String = ""
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        date            <- map["date"]
        low             <- map["low"]
        high            <- map["high"]
        text            <- map["text"]
    }
}
