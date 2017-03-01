//
//  ManufacturerDataSource.swift
//  Auto1Car
//
//  Created by Hardik on 01/03/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import XCTest
@testable import Auto1Car

class ManufacturerDataSourceTests: XCTestCase {
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        
        let manufViewController = displaySelectedCarViewController()
        tableView = manufViewController.tableView
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testManufacturersOnTableview() {

        let dataSource = CarManufacturersDataSource(tableView: tableView)
        
        var manufacturersObjects = [Manufacturer]()
        manufacturersObjects.append(Manufacturer(response: ["100", "Tata"]))
        manufacturersObjects.append(Manufacturer(response: ["101", "Tesla"]))
        manufacturersObjects.append(Manufacturer(response: ["110", "Toyota"]))
        
        dataSource.carManufacturers = manufacturersObjects
        
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 3, "There should be 3 manufacturers on tableview list")

    }
    
    func displaySelectedCarViewController() -> CarManufacturerListViewController {
        return Storyboard.viewController(fromStoryboard: Constants.StoryboardType.main,
                                   withViewControllerIdentifier: "CarManufacturerListViewController") as! CarManufacturerListViewController
    }

    
}
