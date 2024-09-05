//
//  ServiceDataSession.swift
//  Forecast
//
//  Created by Douglas Gehring on 7/23/24.
//

import Foundation

protocol WeatherForecastURLSessionProvider {
    func perform<T: Decodable>(request: URLRequest, completion: @escaping(Result<T, Error>) -> Void)
}

final class WeatherForecastURLSession {
    private lazy var session = URLSession.shared
}

