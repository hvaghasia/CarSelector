//
//  CarModel.swift
//  CarSelector
//
//  Created by Hardik on 26/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import Foundation

/// Class to hold Car model data
final class Model {
    fileprivate(set) var name: String = ""
}

extension Model: JSONDecodable {
    public convenience init(response: Any) {
        self.init()
        
        if let responseDictionary = response as? [String: Any],
            let name = responseDictionary.values.first as? String {
            self.name = name
        }
    }
    
    // parse pagination info and save in AppState for futuer ref
    static func parsePaginationInfo(fromResponse response: [String: Any]) {
        if let currentPage = response[Constants.WebserviceResponseKey.page] as? Int,
            let totalPages = response[Constants.WebserviceResponseKey.totalPageCount] as? Int,
            let pageSize = response[Constants.WebserviceResponseKey.pageSize] as? Int {
            let paginationInfo = (currentPageNo: currentPage,
                                  totalPages: totalPages,
                                  pageSize: pageSize,
                                  isValid: true)
            AppState.sharedState.setModelListPaginationInfo(paginationInfo)
        }
    }
}
