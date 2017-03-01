//
//  CarManufacturersListViewController+Webservice.swift
//  CarSelector
//
//  Created by Hardik on 01/03/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import Foundation

extension CarManufacturerListViewController {
    
    //MARK: Fetch manufacturer list
    func fetchCarManufacturerList() {
        let resourceStats = AppState.sharedState.getPaginationInfo(forList: .manufacturer)
        if resourceStats.isValid {
            NetworkManager.default.getManufacturerList(pageNo: resourceStats.currentPageNo,
                                                       pageSize: resourceStats.pageSize) { [weak self] (result) in
                                                        switch (result) {
                                                        case .success(let manufacturerObjects):
                                                            self?.dataSource?.carManufacturers.append(contentsOf: manufacturerObjects as! [Manufacturer])
                                                        case .failure(let error):
                                                            self?.showAlert(title: "", message: error.localizedDescription)
                                                        }
            }
        }
        
    }
}
