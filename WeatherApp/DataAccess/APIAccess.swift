//
//  APIAccess.swift
//  WeatherApp
//
//  Created by PT Ionnex  on 08/12/2560 BE.
//  Copyright © 2560 BE Xendity. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON

class APIAccess {
    static let TIMEOUT = 120.0
    
    static func AccessWeather(completionHandler: @escaping (Weather, String) -> Void) {
        URLCache.shared.removeAllCachedResponses()
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = TIMEOUT
        manager.request(APIConstant.SERVER_URL, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            var errorResponse = ""
            var output = Weather()
            if response.result.isSuccess {
                if let value: AnyObject = response.result.value as AnyObject? {
                    let result = JSON(value)
                    if let mappedOutput = Mapper<Weather>().map(JSONString: result["query"]["results"].rawString()!) {
                        output = mappedOutput
                    } else {
                        errorResponse = "Unable to map object into Weather Model."
                    }
                } else {
                    errorResponse = "No result from API Server."
                }
            } else {
                errorResponse = response.result.error.debugDescription
            }
            
            completionHandler(output, errorResponse)
        }
    }
}
