//
//  PresentPolicy.swift
//  CoordinatorFlow
//
//  Created by Rodion Negov on 03.03.2018.
//  Copyright © 2018 Rodion Negov. All rights reserved.
//

import UIKit

// MARK: - PresentPolicy
/// Information used by ModuleCoordinator to present view controller in module.
public struct PresentPolicy {
    /// How to present view controller on navigation controller.
    public enum PresentStyle {
        case presentModally(Bool)
        case append
        case push(Bool)
    }
    
    /// Storyboard file name.
    public var storyboardName: String
    
    /// How to present vc at navigationVC.
    public var presentStyle: PresentStyle
    
    /// If true, than navigation controller should be initial and have no rootVC.
    public var loadNavigationControllerFromStoryboard: Bool
    
    /// VC identity from storyboard. If nil load as initial view controller.
    public var vcName: String?
    
    /// Load and set all module dependencies here.
    public var startAction: (() -> (UIViewController?))
    
    public init(storyboardName: String, presentStyle: PresentStyle = .append,
                loadNavigationControllerFromStoryboard: Bool = false, vcName: String? = nil,
                startAction: @escaping (() -> (UIViewController?))) {
        self.storyboardName                         = storyboardName
        self.presentStyle                           = presentStyle
        self.loadNavigationControllerFromStoryboard = loadNavigationControllerFromStoryboard
        self.vcName                                 = vcName
        self.startAction                            = startAction
    }
    
}
