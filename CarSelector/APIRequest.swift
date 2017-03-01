//
//  APIRequest.swift
//  CarSelector
//
//  Created by Hardik on 25/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import Foundation

protocol APIRequest {
    var baseURL: NSURL? { get }
    var method: String { get }
    var path: String { get }
    var parameters: Dictionary<String, String> { get }
    var headers: Dictionary<String, String> { get }
    var accessToken: String { get }
    
    func constructRequest() -> URLRequest?
}

extension APIRequest {
    var baseURL: NSURL? { return NSURL(string: Constants.APIServer) }
    var method: String { return HTTPMethod.GET.toString() }
    var path: String { return "" }
    var parameters: Dictionary<String, String> { return Dictionary<String, String>() }
    var headers: Dictionary<String, String> { return Dictionary<String, String>() }
    var accessToken: String { return "" }
    
    func constructRequest() -> URLRequest? {
        guard let baseURL = baseURL else { return nil }
        guard let URLComponents = NSURLComponents(url: baseURL as URL, resolvingAgainstBaseURL: true) else { return nil }
        URLComponents.path = (URLComponents.path ?? "") + path
        URLComponents.queryItems = parameters.map { key, value in
            return URLQueryItem(name: key, value: value)
        }
        
        guard let URL = URLComponents.url else { return nil }
        let request = NSMutableURLRequest(url: URL)
        
        request.addValue(Constants.applicationJSON, forHTTPHeaderField: Constants.accept)
        request.addValue(Constants.applicationJSON, forHTTPHeaderField: Constants.contentType)
        request.httpMethod = method
        return request as URLRequest
    }
}
