// swift-tools-version:5.9
import PackageDescription

#if TUIST
    import ProjectDescription
    import UtilityPlugin


    let packageSettings = PackageSettings(
        productTypes: [
            "Moya": .framework,
            "ComposableArchitecture": .framework,
            "TCACoordinators": .framework
        ], baseSettings: Settings.settings(configurations: XCConfig.framework)
        
    )
#endif

let package = Package(
    name: "EggtartPackage",
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", exact: "15.0.3"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", exact: "1.9.2"),
        .package(url: "https://github.com/johnpatrickmorgan/TCACoordinators", exact: "0.8.0")
    ]
)
