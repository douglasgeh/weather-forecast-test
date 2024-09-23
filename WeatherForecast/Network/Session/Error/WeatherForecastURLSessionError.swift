//
//  WeatherForecastURLSessionError.swift
//  Forecast
//
//  Created by Douglas Gehring on 7/23/24.
//

import Foundation

// Possible errors resulted from an URLSession request

enum WeatherForecastURLSessionError: Error {
    case invalidURL
    case invalidData
    case generic(String)
}
