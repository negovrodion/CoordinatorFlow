//
//  CoordinatorType.swift
//  CoordinatorFlow
//
//  Created by Rodion Negov on 28.02.2018.
//  Copyright © 2018 Rodion Negov. All rights reserved.
//

import Foundation

// MARK: - CoordinatorType
/// Represent all possible types of coordinators in application. To add new type, just put new static variable into extension.
public struct CoordinatorType: RawRepresentable, Equatable, Hashable, Comparable {
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
    public static func <(lhs: CoordinatorType, rhs: CoordinatorType) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
}

// MARK: - CoordinatorType extension.
// Most common use types.
extension CoordinatorType {
    public static let login    = CoordinatorType(rawValue: "login")
    public static let main     = CoordinatorType(rawValue: "main")
    public static let tutorial = CoordinatorType(rawValue: "tutorial")
}
