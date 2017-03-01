//
//  ViewModelsTest.swift
//  Auto1Car
//
//  Created by Hardik on 01/03/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import XCTest
@testable import CarSelector

class ViewModelsTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testManufaturerViewModel() {
        let manufacturer = Manufacturer(response: ["100": "TATA"])
        let manufacturerViewModel = ManufacturerViewModel(manufacturer: manufacturer)
        
        XCTAssertTrue(manufacturerViewModel.name == "TATA", "Manufacturer name should b TATA")
    }
    
    func testModelViewModel() {
        let model = Model(response: ["Indica": "Indica"])
        let modelViewModel = ModelViewModel(model: model)
        
        XCTAssertTrue(modelViewModel.name == "Indica", "Model name should b Indica")
    }
    
    func testCarViewModel() {
        let manufacturer = Manufacturer(response: ["100": "TATA"])
        let model = Model(response: ["Indica": "Indica"])
        
        let car = Car(withManufacturer: manufacturer, model: model)
        let carViewModel = CarViewModel(car: car)
        
        
        XCTAssertTrue(carViewModel.description == "TATA, Indica", "Car details should b TATA, Indica")
    }
}
