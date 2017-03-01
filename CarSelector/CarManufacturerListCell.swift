//
//  CarManufacturerListCell.swift
//  CarSelector
//
//  Created by Hardik on 24/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import UIKit

class CarManufacturerListCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    var viewModel: ManufacturerViewModel? {
        didSet {
            updateValues()
        }
    }
    
    func configure(withManufacturerViewModel manufacturerViewModel: ManufacturerViewModel,
                   atIndexPath indexPath: IndexPath) {
        viewModel = manufacturerViewModel
        backgroundColor = indexPath.row % 2 == 0 ? .white : .lightGray
    }
}

extension CarManufacturerListCell {
    func updateValues() {
        nameLabel.text = viewModel?.name
    }
}
