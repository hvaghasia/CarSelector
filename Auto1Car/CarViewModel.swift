//
//  CarViewModel.swift
//  Auto1Car
//
//  Created by Hardik on 27/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import Foundation


struct CarViewModel {
    var description: String = ""
    
    init(car: Car) {
        if let manufacturer = car.manufacturer,
            let model = car.model {
            self.description = String(format: "%@, %@", manufacturer.name, model.name)

        }
    }
}
