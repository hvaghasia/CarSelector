//
//  CarManufacturer.swift
//  Auto1Car
//
//  Created by Hardik on 26/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import Foundation

/// Class to hold car manufacturer data
final class Manufacturer {
    fileprivate(set) var id: String = ""
    fileprivate(set) var name: String = ""
}

extension Manufacturer: JSONDecodable {
    public convenience init(response: Any) {
        self.init()
        
        if let responseDictionary = response as? [String: Any],
            let id = responseDictionary.keys.first,
            let name = responseDictionary.values.first as? String {
            self.id = id
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
            AppState.sharedState.setManufacturerListPaginationInfo(paginationInfo)
            
        }

    }
}
