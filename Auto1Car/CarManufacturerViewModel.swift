//
//  CarManufacturerViewModel.swift
//  Auto1Car
//
//  Created by Hardik on 27/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import Foundation

struct ManufacturerViewModel {
    let name: String
    
    init(manufacturer: Manufacturer) {
        self.name = manufacturer.name
    }
}
