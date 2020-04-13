//
//  NetworkResult.swift
//  Pods-SimpleNetwork_Example
//
//  Created by Erick Kaique Da Silva on 13/04/20.
//

import Foundation

public typealias NetworkResult = (Result<Data, NetworkError>) -> Void

public struct NetworkError: Error {
    public let error: NetworkTypeError?
    
    public init(error: NetworkTypeError? = nil) {
        self.error = error
    }
}

public enum NetworkTypeError: Error {
    case noConnection
    case noData
    case noResponse
    case statusCodeError
}
