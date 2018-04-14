//
//  Coordinator.swift
//  CoordinatorFlow
//
//  Created by Rodion Negov on 02/03/18.
//  Copyright © 2018 Rodion Negov. All rights reserved.
//

import UIKit

// MARK: - Coordinator
/// Coordinator for managing other coordinators or module coordinators. Do not subclass or create it manually.
public class Coordinator: AbstractCoordinator {
    fileprivate typealias ChildCoordinatorDescription = (description: CoordinatorDescription,
                                                         presentPolicy: PresentPolicy?)
    fileprivate typealias IsLoadedCoordinator = (isLoaded: Bool, coordinator: AbstractCoordinator)
    
    // MARK: - Private Properties
    fileprivate var childCoordinators            = [CoordinatorType : IsLoadedCoordinator]()
    fileprivate var childCoordinatorsDescription = [CoordinatorType : ChildCoordinatorDescription]()
    fileprivate var coordinatorsStack            = [CoordinatorType]()
    fileprivate var dependencies                 = [CoordinatorType : [CoordinatorType]]()
    
   
    
    // MARK: - Public Properties
    
    /// Current loaded child coordinator.
    internal var currentLoadedChildCoordinator: AbstractCoordinator? {
        for coord in childCoordinators {
            guard coord.value.isLoaded else { continue }
            
            return coord.value.coordinator
        }
        
        return nil
    }
    
    
    /// Put here some logic of loading first module.
    public var startAction: (() -> ())?
    
    // MARK: - Initialization
    public override init() {
        super.init()
    }
    
    internal override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    // MARK: - Functions
    internal override func start() {
        super.start()
        
        startAction?()
    }
    
    /// Load and start already added with `addCoordinator` or `addModuleCoordinator` coordinator.
    public func loadCoordinator(with type: CoordinatorType) {
        guard let descr = childCoordinatorsDescription[type] else {
            return
        }

        // Setup NavigationController
        var navController = navigationController ?? UINavigationController()
        
        if let presentPolicy = descr.presentPolicy, presentPolicy.loadNavigationControllerFromStoryboard {
            navController = AbstractCoordinator.loadNavigationController(in: presentPolicy.storyboardName)
        }
        
        if descr.description.removeAllFromNavigationControllerStackBeforeLoad {
            navigationController?.viewControllers.removeAll()
        }
        
        navigationController = navController
        
        
        // Create & setup Coordinator
        
        let coordinator: AbstractCoordinator
        if let presentPolicy = descr.presentPolicy {
            coordinator                = ModulesCoordinator(presentPolicy: presentPolicy,
                                                            navigationController: navController)
            coordinator.storyboardName = presentPolicy.storyboardName
        } else if let coord = childCoordinators[descr.description.type] {
            coord.coordinator.navigationController = navController
            coordinator                            = coord.coordinator
        } else {
            return
        }
        
        coordinator.callbacks                     = descr.description.callbacks
        childCoordinators[descr.description.type] = IsLoadedCoordinator(isLoaded: true, coordinator: coordinator)
        
        // Unload other coordinators.
        
        if descr.description.clearCoordinatorsStackWhenLoad {
            clearDependencies(by: descr.description.type)
        }
        
        coordinatorsStack.append(descr.description.type)
        
        coordinator.start()
    }
    
    /// Load view controller from storyboard for coordinator.
    /// - parameter type: Coordinator type, firstly must be added via `addModuleCoordinator` function.
    /// Call it after coordinator load. Call it in Start callback to load module`s UIViewCoordinator.
    /// - parameter identifire: Identifire of UIViewController in storyboard file. If `nil`, than will use initial vc.
    public func loadViewController<T>(type: CoordinatorType, identifire: String? = nil) -> T where T : UIViewController {
        guard let descr = childCoordinatorsDescription[type], let presentPolicy = descr.presentPolicy else {
            return T()
        }
        
        storyboardName = presentPolicy.storyboardName
        
        let _identifire = identifire ?? presentPolicy.vcName
        
        if let ident = _identifire {
            return super.loadViewController(identifire: ident)
        } else {
            return super.loadViewController()
        }
    }
    

    /// Add child coordinator.
    /// - parameter description: Use it to setupe coordinator.
    public func addCoordinator(coordinator: Coordinator, with description: CoordinatorDescription) {
        childCoordinators[description.type]            = IsLoadedCoordinator(isLoaded: false, coordinator: coordinator)
        childCoordinatorsDescription[description.type] = ChildCoordinatorDescription(description: description,
                                                                                      presentPolicy: nil)
    }
    
    /// Add child module coordinator.
    /// - parameter description: Use it to setupe coordinator.
    /// - parameter presentPolicy: Use it to pass ui stuff.
    public func addModuleCoordinator(with description: CoordinatorDescription, presentPolicy: PresentPolicy) {
        childCoordinatorsDescription[description.type] = ChildCoordinatorDescription(description: description,
                                                                                     presentPolicy: presentPolicy)
    }
    
    /// Set dependency for one type of coordinator. It means when this coordinator will load, other from arrayOf will
    /// unload. To remove dependency set empty array for CoordinatorType.
    public func setDependency(when load: CoordinatorType, remove arrayOf: [CoordinatorType]) {
        dependencies[load] = arrayOf
    }
    
    /// Unload top coordinator and its children.
    public func popTopCoordinator() {
        guard let type = coordinatorsStack.popLast() else {
            return
        }
        
        childCoordinators[type] = nil
    }
    
    // MARK: - Private functions
    
    /// Invokes unload of dependent coordinators. Should be called before loadCoordinator().
    fileprivate func clearDependencies(by: CoordinatorType) {
        guard let dependenciesBy = dependencies[by] else {
            return
        }
        
        while coordinatorsStack.last != nil {
            guard let last = coordinatorsStack.last, last != by else {
                break
            }
            
            _ = coordinatorsStack.popLast()
        }
        
        for item in dependenciesBy {
            guard let coord = childCoordinators[item], coord.isLoaded else { continue }
            
            childCoordinators[item] = nil
        }
    }
}
