//
//  JSONParsingProtocol.swift
//  Auto1Car
//
//  Created by Hardik on 26/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import Foundation

protocol JSONDecodable {
    init(response: Any)
    static func parsePaginationInfo(fromResponse response: [String: Any])
}

extension JSONDecodable {
    static func parsePaginationInfo(fromResponse response: [String: Any]) {}
}

