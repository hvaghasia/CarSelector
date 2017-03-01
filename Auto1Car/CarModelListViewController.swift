//
//  CarModelListViewController.swift
//  Auto1Car
//
//  Created by Hardik on 24/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import UIKit

class CarModelListViewController: UITableViewController {
    
    var dataSource: CarModelsDataSource?
    var manufacturer: Manufacturer?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = manufacturer?.name
        AppState.sharedState.resetModelPaginationInfo()
        configureDataSource()
        fetchModelsList()
    }

    // Configure datasource which provides models data to display on list
    fileprivate func configureDataSource() {
        if let manufaturer = manufacturer {
            dataSource = CarModelsDataSource(tableView: tableView, manufacturer: manufaturer)
            tableView.dataSource = dataSource
        }
    }
}


// MARK: Tableview delegate methods
extension CarModelListViewController {
    
    // Display selected car details on next screen
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCar = dataSource?.selectedCarObject(atIndex: indexPath.row)
        
        let displayCarDetailsVC = Storyboard.displaySelectedCarViewController()
        displayCarDetailsVC.selectedCar = selectedCar
        navigationController?.pushViewController(displayCarDetailsVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //If user reaches at end of list , fetch next batch of models
        if indexPath.row == tableView.numberOfRows(inSection: 0) - 1 {
            fetchModelsList()
        }
    }
}
