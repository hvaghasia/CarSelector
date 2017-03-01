//
//  ModelTests.swift
//  Auto1Car
//
//  Created by Hardik on 01/03/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import XCTest
@testable import Auto1Car

class ModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testManufacturer() {
        let manufacturer = Manufacturer(response: ["100": "TATA"])
        
        XCTAssertTrue(manufacturer.id == "100", "Manufacturer Id should b 100")
        XCTAssertTrue(manufacturer.name == "TATA", "Manufacturer name should b TATA")
        
    }
    
    func testModel() {
        let model = Model(response: ["Indica": "Indica"])
        XCTAssertTrue(model.name == "Indica", "Model name should b Indica")
        
    }
    
}
