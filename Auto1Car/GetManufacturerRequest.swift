//
//  GetManufacturerRequest.swift
//  Auto1Car
//
//  Created by Hardik on 25/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import Foundation

struct GetManufacturerRequest: APIRequest {
    var path: String
    var parameters = Dictionary<String, String>()
    
    init(withPageNo pageNo: Int, pageSize: Int) {
        self.path = Constants.getManufacturerList
        self.parameters = [Constants.RequestParameter.page: "\(pageNo)",
                           Constants.RequestParameter.pageSize: "\(pageSize)",
                           Constants.RequestParameter.wa_key: Constants.RequestParameterValue.wa_key]
    }
}
