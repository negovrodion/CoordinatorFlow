//
//  CoordinatorDescription.swift
//  CoordinatorFlow
//
//  Created by Rodion Negov on 03.03.2018.
//  Copyright © 2018 Rodion Negov. All rights reserved.
//

import UIKit

// MARK: - CoordinatorDescription
/// Parameters to setup coordinator.
public struct CoordinatorDescription {
    /// Type of coordinator, should be unique. To add new type add variable to CoordinatorType extension.
    public var type: CoordinatorType
    
    /// Should remove all view controllers from viewControllers before add load this one.
    public var removeAllFromNavigationControllerStackBeforeLoad: Bool
    
    /// Should clear dependencies.
    public var clearCoordinatorsStackWhenLoad: Bool
    
    /// Callback functions for module.
    public var callbacks: TypedCallbackArray
    
    public init(type: CoordinatorType, removeAllFromNavigationControllerStackBeforeLoad: Bool = true,
         clearCoordinatorsStackWhenLoad: Bool = true, callbacks: TypedCallbackArray? = nil) {
        self.type                                             = type
        self.removeAllFromNavigationControllerStackBeforeLoad = removeAllFromNavigationControllerStackBeforeLoad
        self.clearCoordinatorsStackWhenLoad                   = clearCoordinatorsStackWhenLoad
        self.callbacks                                        = callbacks ?? TypedCallbackArray()
    }
    
}
