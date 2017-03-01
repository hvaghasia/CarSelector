//
//  CarModelsListViewController+Webservice.swift
//  Auto1Car
//
//  Created by Hardik on 01/03/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import Foundation


extension CarModelListViewController {
    
    ///MARK: fetch models list
    func fetchModelsList() {
        let paginationInfo = AppState.sharedState.getPaginationInfo(forList: .model)
        if let dataSource = dataSource, paginationInfo.isValid {
            NetworkManager.default.getModels(forManufacturerId: dataSource.manufacturer.id, pageNo: paginationInfo.currentPageNo, pageSize: paginationInfo.pageSize) { [weak self] (result) in
                switch (result) {
                case .success(let models):
                    self?.dataSource?.models.append(contentsOf: models as! [Model])
                    break
                case .failure(let error):
                    self?.showAlert(title: "", message: error.localizedDescription)
                }
            }
        }
    }
}
