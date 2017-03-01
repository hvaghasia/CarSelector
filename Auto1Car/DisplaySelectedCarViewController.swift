//
//  DisplaySelectedCarViewController.swift
//  Auto1Car
//
//  Created by Hardik on 26/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import UIKit

class DisplaySelectedCarViewController: UIViewController {

    // Car object to hold data of selected manufacturer and model
    var selectedCar: Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayCarDetails()
    }
    
    fileprivate func displayCarDetails() {
        if let car = selectedCar {
            let carViewModel = CarViewModel(car: car)
            showAlert(title: carViewModel.description) { [weak self] in
                self?.navigationController?.popToRootViewController(animated: true)
            }
        }
        
    }
}
