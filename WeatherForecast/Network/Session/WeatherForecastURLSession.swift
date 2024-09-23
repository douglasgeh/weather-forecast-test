//
//  ServiceDataSession.swift
//  Forecast
//
//  Created by Douglas Gehring on 7/23/24.
//

import Foundation

protocol WeatherForecastURLSessionProvider {
    func perform<T: Decodable>(request: URLRequest, completion: @escaping(Result<T, WeatherForecastURLSessionError>) -> Void)
    func perform(request: URLRequest, completion: @escaping(Result<Data, WeatherForecastURLSessionError>) -> Void)
}

final class WeatherForecastURLSession {
    
    private lazy var session = URLSession.shared
    
    private func urlSessionError(from error: Error?) -> WeatherForecastURLSessionError {
        guard let error = error else { return .invalidData }
        return .generic(error.localizedDescription)
    }
}

extension WeatherForecastURLSession: WeatherForecastURLSessionProvider {
    
    // perform<T: Decodable> : request, completion -> Void
    // By receiving a decodable type, URLRequest and a completion handler
    // this method will request data based on the URL provided
    // and return it according to the corresponding model. Otherwise
    // returns an error in case the data is invalid / server issues
    
    func perform<T: Decodable>(
        request: URLRequest,
        completion: @escaping (Result<T, WeatherForecastURLSessionError>) -> Void)
    {
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data, let result = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(self.urlSessionError(from: error)))
                return
            }
            completion(.success(result))
        }
        task.resume()
    }
    
    // perform: request, completion -> Void
    // Given a request and a completion handler
    // this method will request data based on the URL provided
    // and return it. Otherwise returns an error in case the data
    // is invalid/server issues
    
    func perform(
        request: URLRequest,
        completion: @escaping(Result<Data, WeatherForecastURLSessionError>) -> Void)
    {
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(.failure(self.urlSessionError(from: error)))
                return
            }
            completion(.success(data))
        }
        task.resume()
        
    }
    
}
