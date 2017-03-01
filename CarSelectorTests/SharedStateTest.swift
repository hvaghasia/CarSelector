//
//  SharedStateTest.swift
//  Auto1Car
//
//  Created by Hardik on 01/03/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import XCTest
@testable import CarSelector

class SharedStateTest: XCTestCase {
    
    let testPaginationInfo: PaginationInfo = (currentPageNo: -1,
                                              totalPages: 0,
                                              pageSize: Constants.pageSize,
                                              isValid: false)
    //to test failure scenario
    let failTestPaginationInfo: PaginationInfo = (currentPageNo: 0,
                                                  totalPages: 0,
                                                  pageSize: Constants.pageSize,
                                                  isValid: false)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSetManufacturerPaginationInfo() {
        
        AppState.sharedState.setManufacturerListPaginationInfo(testPaginationInfo)
        
        let manufacturerPaginationInfo = AppState.sharedState.getPaginationInfo(forList: .manufacturer)
        
        XCTAssertTrue(manufacturerPaginationInfo.currentPageNo == 0, "Current page # should b Zero")
        XCTAssertTrue(manufacturerPaginationInfo.isValid, "isValid should b true as ther is more data on server to download.")
        XCTAssertTrue(manufacturerPaginationInfo.pageSize == Constants.pageSize, "Page size should b 15")

        //test failure scenario
        AppState.sharedState.setManufacturerListPaginationInfo(failTestPaginationInfo)
        
        let failManufacturerPaginationInfo = AppState.sharedState.getPaginationInfo(forList: .manufacturer)
        XCTAssertTrue(!failManufacturerPaginationInfo.isValid, "isValid should b False as ther is no data on server to download.")
    }
    
    func testSetModelPaginationInfo() {
        AppState.sharedState.setManufacturerListPaginationInfo(testPaginationInfo)
        
        let modelPaginationInfo = AppState.sharedState.getPaginationInfo(forList: .model)
        
        XCTAssertTrue(modelPaginationInfo.currentPageNo == 0, "Current page # should b Zero")
        XCTAssertTrue(modelPaginationInfo.isValid, "isValid should b true as ther is more data on server to download.")
        XCTAssertTrue(modelPaginationInfo.pageSize == Constants.pageSize, "Page size should b 15")
        
        //test failure scenario
        AppState.sharedState.setModelListPaginationInfo(failTestPaginationInfo)
        
        let failModelPaginationInfo = AppState.sharedState.getPaginationInfo(forList: .model)
        XCTAssertTrue(!failModelPaginationInfo.isValid, "isValid should b False as ther is no data on server to download.")
    }
    
}
