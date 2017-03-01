//
//  Car.swift
//  CarSelector
//
//  Created by Hardik on 25/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import Foundation

/// Class to hold Car data
final class Car {
    private(set) var manufacturer: Manufacturer?
    private(set) var model: Model?
    
    init(withManufacturer manufacturer: Manufacturer, model: Model) {
        self.manufacturer = manufacturer
        self.model = model
    }
}

