//
//  ModelsDataSourceTests.swift
//  Auto1Car
//
//  Created by Hardik on 01/03/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import XCTest
@testable import Auto1Car

class ModelsDataSourceTests: XCTestCase {
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        
        let modelsViewController = Storyboard.modelListViewController()
        tableView = modelsViewController.tableView
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testManufacturersOnTableview() {
        let manufacturer = Manufacturer(response: ["100", "BMW"])
        let dataSource = CarModelsDataSource(tableView: tableView, manufacturer: manufacturer)
        
        var modelObjects = [Model]()
        modelObjects.append(Model(response: ["X6", "X6"]))
        modelObjects.append(Model(response: ["X1", "X1"]))
        
        dataSource.models = modelObjects
        
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 2, "There should be 2 models on tableview list")
    }
}
