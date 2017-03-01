//
//  CarModelsDataSource.swift
//  Auto1Car
//
//  Created by Hardik on 26/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import Foundation
import UIKit

class CarModelsDataSource: NSObject {
    // The tableview to display models name
    fileprivate weak var tableView: UITableView!
    
    // Manufactuer model
    var manufacturer: Manufacturer
    
    // Array of Models which holds models details
    var models = [Model]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // Initializer
    init(tableView: UITableView, manufacturer: Manufacturer) {
        self.tableView = tableView
        self.manufacturer = manufacturer
        super.init()
    }
    
    // Create Car object from selected manufacturer and model
    func selectedCarObject(atIndex index: Int) -> Car {
        return Car(withManufacturer: manufacturer, model: models[index])
    }
}

//// MARK: - Table view data source
extension CarModelsDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusable(cellClass: CarModelListCell.self, forIndexPath: indexPath)
        let model = models[indexPath.row]
        let modelViewModel = ModelViewModel(model: model)
        cell.configure(withModelViewModel: modelViewModel, atIndexPath: indexPath)
        return cell
    }
}
