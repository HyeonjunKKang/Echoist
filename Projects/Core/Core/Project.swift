//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 강현준 on 4/8/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin


let project = Project.makeModule(
    name: "Core",
    targets: [.dynamicFramework],
    internalDependencies: [
        .data,
        .Core.designKit
    ]
)
