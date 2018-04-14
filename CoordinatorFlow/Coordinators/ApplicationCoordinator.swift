//
//  ApplicationCoordinator.swift
//  CoordinatorFlow
//
//  Created by Rodion Negov on 02/03/18.
//  Copyright © 2018 Rodion Negov. All rights reserved.
//

import UIKit

// MARK: - ApplicationCoordinator
/// Root coordinator. Use it in AppDelegate.
public final class ApplicationCoordinator: Coordinator {
    
    // MARK: - Properties
    /// Use this window to replace window in AppDelegate.
    public let window: UIWindow
    
    public override init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        super.init()
        
        navigationController = nil
    }
    
    // MARK: - Public Interface
    public override func start() {
        super.start()
    }
    
    var nc: UINavigationController?
    
    public override func loadCoordinator(with type: CoordinatorType) {
        super.loadCoordinator(with: type)

        navigationController      = currentLoadedChildCoordinator?.navigationController
        window.rootViewController = navigationController
    }
    
}



