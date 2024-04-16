import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "MainFeature",
    targets: Set(FeatureTarget.microFeature),
    internalDependencies: [
    ],
    interfaceDependencies: [
        .Core.core
    ]
)


