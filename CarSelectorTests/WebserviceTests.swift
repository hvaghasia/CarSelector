//
//  WebserviceTests.swift
//  CarSelector
//
//  Created by Hardik on 01/03/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import XCTest
@testable import CarSelector

class WebserviceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testGetManufacturersList() {
        let expectation = self.expectation(description: "GetManufacturerList")
        NetworkManager.default.getManufacturerList(pageNo: 0,
                                                   pageSize: 10) { (result) in
                                                    switch (result) {
                                                    case .success(let manufacturerObjects):
                                                        XCTAssertTrue(manufacturerObjects.count != 0, "Manufactures list count zero")
                                                    case .failure(let error):
                                                        XCTAssert(false, error.localizedDescription)
                                                        break
                                                    }
                                                    expectation.fulfill()
        }
        waitForExpectations(timeout: 10.0, handler:nil)
    }
    
    func testGetModelsList() {
        let expectation = self.expectation(description: "GetModelsList")
        
        NetworkManager.default.getModels(forManufacturerId: "130", pageNo: 0, pageSize: 10) {(result) in
            switch (result) {
            case .success(let models):
                XCTAssertTrue(models.count != 0, "Models list count zero")
                break
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10.0, handler:nil)
    }
    
}
