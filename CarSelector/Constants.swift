//
//  Constants.swift
//  CarSelector
//
//  Created by Hardik on 25/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import Foundation

struct Constants {
    // Headers
    static let accept = "Accept"
    static let contentType = "Content-Type"
    
    // Values
    static let applicationJSON = "application/json"
    
    // Servers
    static let APIServer = "http://api-aws-eu-qa-1.auto1-test.com/"
    
    // Resourse path
    static let getManufacturerList = "v1/car-types/manufacturer"
    static let getModelsList = "v1/car-types/main-types"
    
    static let pageSize = 15
    
    struct WebserviceResponseKey {
        static let page = "page"
        static let totalPageCount = "totalPageCount"
        static let pageSize = "pageSize"
        static let wkda = "wkda"
    }
    
    struct RequestParameter {
        static let page = "page"
        static let pageSize = "pageSize"
        static let wa_key = "wa_key"
        static let manufacturer = "manufacturer"
    }
    
    struct RequestParameterValue {
        static let wa_key = "coding-puzzle-client-449cc9d"
    }
    
    struct StoryboardType {
        static let main = "Main"
    }
    
    struct ViewControllerIdentifier {
        static let manufacturerList = "CarManufacturerListViewController"
        static let modelList = "CarModelListViewController"
        static let displayCarDetails = "DisplaySelectedCarViewController"
    }
    
    struct AlertViewActionButtonTitle {
        static let ok = "Ok"
    }
}

enum HTTPMethod: String {
    case GET = "GET"
    
    func toString() -> String {
        return self.rawValue
    }
}

enum DataListType {
    case manufacturer
    case model
}
