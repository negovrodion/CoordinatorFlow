//
//  CoordinatorModuleProtocol.swift
//  CoordinatorFlow
//
//  Created by Rodion Negov on 03.03.2018.
//  Copyright © 2018 Rodion Negov. All rights reserved.
//

import Foundation

// MARK: - CoordinatorModuleProtocol
/// Some class in module (ViewController in MVC, Presenter on MVP etc) should implement this protocol to interact with coordinator.
public protocol CoordinatorModuleProtocol {
    /// List of callbacks.
    var callbacks: TypedCallbackArray { get set }
}
