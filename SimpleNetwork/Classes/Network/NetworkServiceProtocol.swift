//
//  NetworkServiceProtocol.swift
//  Pods-SimpleNetwork_Example
//
//  Created by Erick Kaique Da Silva on 13/04/20.
//

import Foundation

public protocol NetworkServiceProtocol {
    var baseUrl: String { get }
    var path: String { get }
    var networkMethod: NetworkMethods { get }
    var headers: [String: String]? { get }
}
