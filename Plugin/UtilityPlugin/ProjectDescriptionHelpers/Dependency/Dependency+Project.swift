//
//  Dependency+Project.swift
//  UtilityPlugin
//
//  Created by 강현준 on 4/8/24.
//

import ProjectDescription

public typealias Dep = TargetDependency

public extension Dep {
    struct Features {
        public struct Main {}
        public struct Splash {}
    }
    
    struct Core {
        public struct DesignKit {}
        public struct NetworkKit {}
    }
}

public extension Dep {
    static let domain = Dep.project(target: "Domain", path: .domain)
    static let shared = Dep.project(target: "Shared", path: .shared)
    static let thirdPartyLib = Dep.project(target: "ThirdPartyLib", path: .thirdPartyLib)
}

public extension Dep.Core {
    static let core = Dep.project(target: "Core", path: .core)
    static let designKit = Dep.project(target: "DesignKit", path: .designKit)
    static let networkKit = Dep.project(target: "NetworkKit", path: .networkKit)
}

public extension Dep.Features {
    static func project(name: String, group: String) -> Dep { .project(target: "\(group)\(name)", path: .relativeToFeature("\(group)\(name)")) }
    
    static let rootFeature = TargetDependency.project(target: "RootFeature", path: .relativeToFeature("RootFeature"))
}

//MARK: Features
public extension Dep.Features.Splash {
    static let group = "Splash"
    
    static let Feature = Dep.Features.project(name: "Feature", group: group)
    static let Interface = Dep.project(target: "\(group)FeatureInterface", path: .relativeToFeature("\(group)Feature"))
}

public extension Dep.Features.Main {
    static let group = "Main"
    
    static let Feature = Dep.Features.project(name: "Feature", group: group)
    static let Interface = Dep.project(target: "\(group)FeatureInterface", path: .relativeToFeature("\(group)Feature"))
}
