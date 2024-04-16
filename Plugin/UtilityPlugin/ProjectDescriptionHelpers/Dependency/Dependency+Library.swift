//
//  Dependency+Library.swift
//  UtilityPlugin
//
//  Created by 강현준 on 4/8/24.
//

import Foundation

import ProjectDescription

public extension TargetDependency {
    enum SPM {}
    enum Carthage {}
    enum XCFramework {}
}

public extension TargetDependency.SPM {
    static let Moya = TargetDependency.external(name: "Moya")
    static let TCA = TargetDependency.external(name: "ComposableArchitecture")
    static let TCACoordinators = TargetDependency.external(name: "TCACoordinators")
}

public extension TargetDependency.XCFramework {
    
}

public extension Package {
    
}

public extension TargetDependency.Carthage {
    
}
