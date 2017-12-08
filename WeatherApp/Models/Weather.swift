//
//  Weather.swift
//  WeatherApp
//
//  Created by PT Ionnex  on 08/12/2560 BE.
//  Copyright © 2560 BE Xendity. All rights reserved.
//

import Foundation
import ObjectMapper

class Weather: Mappable {
    var city: String = ""
    var country: String = ""
    var conditionDate: String = ""
    var conditionTemp: String = ""
    var conditionText: String = ""
    
    var forecasts: [Forecast] = []
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        city            <- map["channel.location.city"]
        country         <- map["channel.location.country"]
        conditionDate   <- map["channel.item.condition.date"]
        conditionTemp   <- map["channel.item.condition.temp"]
        conditionText   <- map["channel.item.condition.text"]
        
        forecasts       <- map["channel.item.forecast"]
    }
}
