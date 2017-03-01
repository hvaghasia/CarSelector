//
//  GetModelsRequest.swift
//  Auto1Car
//
//  Created by Hardik on 26/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import Foundation

struct GetModelsRequest: APIRequest {
    var path: String
    var parameters = Dictionary<String, String>()
    
    init(withManufacturerId manufacturerId: String, pageNo: Int, pageSize: Int) {
        self.path = Constants.getModelsList
        self.parameters = [Constants.RequestParameter.manufacturer: manufacturerId,
                           Constants.RequestParameter.page: "\(pageNo)",
                           Constants.RequestParameter.pageSize: "\(pageSize)",
                           Constants.RequestParameter.wa_key: Constants.RequestParameterValue.wa_key]
    }
}
