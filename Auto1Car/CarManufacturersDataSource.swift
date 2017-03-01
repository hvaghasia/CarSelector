//
//  CarManufacturersDataSource.swift
//  Auto1Car
//
//  Created by Hardik on 26/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import Foundation
import UIKit

class CarManufacturersDataSource: NSObject {
    
    // The tableview to display manufacturer name
    fileprivate weak var tableView: UITableView!
    
    // The array of manufacturer model which holds manufacturer details
    var carManufacturers = [Manufacturer]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // Initializer
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
    }
}

/// MARK: - Table view data source
extension CarManufacturersDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carManufacturers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusable(cellClass: CarManufacturerListCell.self, forIndexPath: indexPath)
        let manufacturer = carManufacturers[indexPath.row]
        let manufacturerViewModel = ManufacturerViewModel(manufacturer: manufacturer)
        cell.configure(withManufacturerViewModel: manufacturerViewModel,
                       atIndexPath: indexPath)
        return cell
    }
}
