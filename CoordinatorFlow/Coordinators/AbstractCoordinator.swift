//
//  AbstractCoordinator.swift
//  CoordinatorFlow
//
//  Created by Rodion Negov on 02/03/18.
//  Copyright © 2018 Rodion Negov. All rights reserved.
//

import UIKit

// MARK: - AbstractCoordinator
/// Abstract class for coordinators. Do not create it.
public class AbstractCoordinator {    
    // MARK: - Public Properties
    
    /// Navigation controller currently represented at ui stack.
    public weak var navigationController: UINavigationController?
    
    /// Contains string with name of storyboard file, which will be used to load UIVIewControllers and UINavigationControllers.
    public var storyboardName: String?
    
    /// Callbacks of modules ot coordinators. Allow to call some action or provide some data from module.
    public var callbacks = TypedCallbackArray()

    // MARK: Private Properties
    fileprivate var started = false
    
    
    // MARK: - Initialization
    internal init() {
        
    }
    
    internal init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Public Interface
    /// Start all work.
    internal func start() {
        guard !started else {
            fatalError("AbstractCoordinator.start() call it just once.")
        }
        
        started = true
        
    }
    
    /// Load UIViewController form storyboard, passed in variable storyboardName.
    /// - parameter identifire: if nil, ViewController must be marked as initial view controller in storyboard.
    internal func loadViewController<T>(identifire: String? = nil) -> T where T: UIViewController {
        guard let stName = storyboardName else {
            return T()
        }
        
        let viewController: UIViewController?
        
        if let ident = identifire {
            viewController = UIStoryboard.storyboard(storyboard: stName, withIdentifire: ident)
        } else {
            viewController = UIStoryboard.storyboard(storyboard: stName)
        }
        
        return viewController as! T
    }
    
    // MARK: - Static functions
    /// Load UINavigationController from storyboard. NavigationController must be marked as initial view controller.
    /// - parameter storyboard: Storyboard name.
    internal static func loadNavigationController(in storyboard: String) -> UINavigationController {
        let navigationViewController = UIStoryboard.storyboard(storyboard: storyboard)
        
        return navigationViewController as! UINavigationController
        
    }
}
