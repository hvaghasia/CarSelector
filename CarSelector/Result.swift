//
//  Result.swift
//  CarSelector
//
//  Created by Hardik on 25/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import Foundation

public enum Result<T> {
    case success(T)
    case failure(Error)
}
