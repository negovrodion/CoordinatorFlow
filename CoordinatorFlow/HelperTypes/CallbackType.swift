//
//  CallbackType.swift
//  CoordinatorFlow
//
//  Created by Rodion Negov on 03.03.2018.
//  Copyright © 2018 Rodion Negov. All rights reserved.
//

import Foundation

/// Type for callbacks.
public typealias TypedCallbackArray = [CallbackType : CallbackFunctionType]

/// Type for callbacks in modules.
public typealias CallbackFunctionType = ((Any?) -> (Any?))

// MARK: - CallbackType
/// Represent all possible types of coordinators in application. To add new type, just put new static variable into extension.
public struct CallbackType: RawRepresentable, Equatable, Hashable, Comparable {
    public typealias RawValue = String
    
    public var rawValue: String
    
    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
    
    // MARK: - Hashable
    public var hashValue: Int {
        return rawValue.hashValue
    }
    
    // MARK: - Comparable
    public static func <(lhs: CallbackType, rhs: CallbackType) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
}

// MARK: - CallbackType extension.
// Most common use types.
extension CallbackType {
    public static let finished = CallbackType(rawValue: "finished")
}
