//
//  ModulesCoordinator.swift
//  CoordinatorFlow
//
//  Created by Rodion Negov on 02/03/18.
//  Copyright © 2018 Rodion Negov. All rights reserved.
//

import UIKit

// MARK: - ModulesCoordinator
/// Coordinator for managing modules. Do not create it manually.
public final class ModulesCoordinator: AbstractCoordinator {
    
    // MARK: - Private Properties
    fileprivate var presentPolicy: PresentPolicy
    
    fileprivate enum Constants {
        static let empty = ""
    }

    internal init(presentPolicy: PresentPolicy, navigationController: UINavigationController) {
        self.presentPolicy = presentPolicy
        
        super.init(navigationController: navigationController)
        
        storyboardName = presentPolicy.storyboardName
    }
    
    internal override func start() {
        super.start()
        
        guard let vc = presentPolicy.startAction() else {
            return
        }

        switch presentPolicy.presentStyle {
        case .append:
            navigationController?.viewControllers.append(vc)
        case .presentModally(let animated):
            vc.modalTransitionStyle = .crossDissolve
            navigationController?.present(vc, animated: animated, completion: nil)
        case .push(let animated):
            navigationController?.pushViewController(vc, animated: animated)
        }
    }
    
    
}

