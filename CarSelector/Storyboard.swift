//
//  Storyboard.swift
//  CarSelector
//
//  Created by Hardik on 26/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import Foundation
import UIKit

// Class to provide instantiated custom viewcontroller
class Storyboard {
    
    class func viewController(fromStoryboard name: String, withViewControllerIdentifier identifier: String) -> UIViewController {
        let storyBoard = UIStoryboard(name: name, bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: identifier) as UIViewController
    }
    
    //MARK: Custom View Controllers
    class func manufacturerListViewController() -> CarManufacturerListViewController {
        return self.viewController(fromStoryboard: Constants.StoryboardType.main,
                                   withViewControllerIdentifier: Constants.ViewControllerIdentifier.manufacturerList) as! CarManufacturerListViewController
    }
    
    class func modelListViewController() -> CarModelListViewController {
        return self.viewController(fromStoryboard: Constants.StoryboardType.main,
                                   withViewControllerIdentifier: Constants.ViewControllerIdentifier.modelList) as! CarModelListViewController
    }
    
    class func displaySelectedCarViewController() -> DisplaySelectedCarViewController {
        return self.viewController(fromStoryboard: Constants.StoryboardType.main,
                                   withViewControllerIdentifier: Constants.ViewControllerIdentifier.displayCarDetails) as! DisplaySelectedCarViewController
    }
    
}
