//
//  UIStoryboard.swift
//  CoordinatorFlow
//
//  Created by Rodion Negov on 02/03/18.
//  Copyright © 2018 Rodion Negov. All rights reserved.
//

import UIKit

// MARK: - UIStoryboard
extension UIStoryboard {
    
    /// Load UIViewController from storyboard.
    /// - parameter storyboard: Name of storyboard file. Example: file name is Main.storyboard, so `storyboard`
    /// should be `Main`
    /// - parameter withIdentifire: Controller identifire. If nil, than is should be initial view controller.
    static func storyboard(storyboard: String, withIdentifire: String? = nil) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        if let identufure = withIdentifire {
            return storyboard.instantiateViewController(withIdentifier: identufure)
        }
        
        return storyboard.instantiateInitialViewController()
    }
}
