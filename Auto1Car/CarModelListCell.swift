//
//  CarModelListCell.swift
//  Auto1Car
//
//  Created by Hardik on 24/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import UIKit

class CarModelListCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    var viewModel: ModelViewModel? {
        didSet {
            updateValues()
        }
    }
    
    func configure(withModelViewModel modelViewModel: ModelViewModel,
                   atIndexPath indexPath: IndexPath) {
        viewModel = modelViewModel
        backgroundColor = indexPath.row % 2 == 0 ? .lightGray : .white
    }
}

extension CarModelListCell {
    func updateValues() {
        nameLabel.text = viewModel?.name

    }
}
