//
//  CarModelViewModel.swift
//  CarSelector
//
//  Created by Hardik on 27/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import Foundation

struct ModelViewModel {
    let name: String
    
    init(model: Model) {
        self.name = model.name
    }
}
