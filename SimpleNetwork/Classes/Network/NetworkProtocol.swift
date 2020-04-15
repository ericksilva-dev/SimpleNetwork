//
//  NetworkProtocol.swift
//  Pods-SimpleNetwork_Example
//
//  Created by Erick Kaique Da Silva on 13/04/20.
//

import Foundation

public protocol NetworkProtocol {
    func request(_ service: NetworkServiceProtocol, completion: NetworkResult?)
}

class SimpleNetwork: NetworkProtocol {
    
    var sessionConfig: URLSessionConfiguration = {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 60.0
        sessionConfig.timeoutIntervalForResource = 80.0
        return sessionConfig
    }()
    
    lazy var pinnedUrlSession: URLSession = {
        return URLSession(configuration: sessionConfig)
    }()
    
    private let successCode: Range<Int> = 200..<299
    
    func request(_ service: NetworkServiceProtocol, completion: NetworkResult?) {
        guard let urlRequest = configurationUrl(with: service) else {
            return
        }
        execute(request: urlRequest, urlSession: pinnedUrlSession, completion: completion)
    }
    
    func configurationUrl(with service: NetworkServiceProtocol) -> URLRequest? {
        
        guard let urlService = URL(string: "\(service.baseUrl)/\(service.path)") else {
            return nil
        }
        
        var urlRequest = URLRequest(url: urlService)
        urlRequest.httpMethod = service.networkMethod.rawValue
        
        return urlRequest
    }
    
    func execute(request: URLRequest, urlSession: URLSession, completion: NetworkResult?) {
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let response = response as? HTTPURLResponse else {
                    completion?(.failure(NetworkError(error: .noResponse)))
                    return
                }
                guard self.successCode.contains(response.statusCode) else {
                    completion?(.failure(NetworkError(error: .statusCodeError)))
                    return
                }
                
                guard let data = data else {
                    completion?(.failure(NetworkError(error: .noData)))
                    return
                }
                print("Response: \(String(describing: data))")
                completion?(.success(data))
            }
        }
        dataTask.resume()
    }
}
