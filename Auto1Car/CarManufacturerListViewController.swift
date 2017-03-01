//
//  ViewController.swift
//  Auto1Car
//
//  Created by Hardik on 24/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import UIKit

class CarManufacturerListViewController: UITableViewController {
    
    var dataSource: CarManufacturersDataSource?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDataSource()
        fetchCarManufacturerList()
    }
    
    // Configure datasource which provides manufacturer data to display on list
    fileprivate func configureDataSource() {
        dataSource = CarManufacturersDataSource(tableView: tableView)
        tableView.dataSource = dataSource
    }
}

// MARK: Tableview delegate methods
extension CarManufacturerListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modelListVC = Storyboard.modelListViewController()
        modelListVC.manufacturer = dataSource?.carManufacturers[indexPath.row]
        navigationController?.pushViewController(modelListVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //If user reaches at end of list, fetch next batch of manufacturers
        if indexPath.row == tableView.numberOfRows(inSection: 0) - 1 {
            fetchCarManufacturerList()
        }
    }
}

