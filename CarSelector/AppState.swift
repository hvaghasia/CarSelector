//
//  AppState.swift
//  CarSelector
//
//  Created by Hardik on 27/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import UIKit

typealias PaginationInfo = (currentPageNo: Int, totalPages: Int, pageSize: Int, isValid: Bool)

//Class to hold shared data accross the app
class AppState {
    
    static let sharedState = AppState()
    private var manufacturersListPagingInfo: PaginationInfo = (currentPageNo: -1,
                                                      totalPages: 0,
                                                      pageSize: Constants.pageSize,
                                                      isValid: false)
    private var modelsListPagingInfo: PaginationInfo = (currentPageNo: -1,
                                                      totalPages: 0,
                                                      pageSize: Constants.pageSize,
                                                      isValid: false)

    
    func setManufacturerListPaginationInfo(_ paginationInfo: PaginationInfo) {
        manufacturersListPagingInfo = paginationInfo
    }
    
    func setModelListPaginationInfo(_ paginationInfo: PaginationInfo) {
        modelsListPagingInfo = paginationInfo
    }
    
    // get pagination info for given list type e.g manufacturer or model
    func getPaginationInfo(forList listType: DataListType) -> PaginationInfo {
        var paginationInfo: PaginationInfo
        // get pagination info depending upon given list type
        paginationInfo = listType == .manufacturer ? manufacturersListPagingInfo : modelsListPagingInfo
        
        // Check if more data available on server to fetch
        paginationInfo.isValid = paginationInfo.currentPageNo < paginationInfo.totalPages
        
        // update currentPageNo in order to fetch next valid banch of data
        paginationInfo.currentPageNo += paginationInfo.isValid ? 1 : 0
        
        return paginationInfo
    }
    
    /// Reset model pagination info so other models can b fetched from beggining
    func resetModelPaginationInfo() {
        modelsListPagingInfo = (currentPageNo: -1,
                                totalPages: 0,
                                pageSize: Constants.pageSize,
                                isValid: true)
    }
}
