// swift-tools-version:5.9
import PackageDescription

#if TUIST
    import ProjectDescription
    import UtilityPlugin


    let packageSettings = PackageSettings(
        productTypes: [
            "Moya": .framework,
            "ComposableArchitecture": .framework,
        ], baseSettings: Settings.settings(configurations: XCConfig.framework)
        
    )
#endif

let package = Package(
    name: "EggtartPackage",
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.3")),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", .upToNextMajor(from: "1.9.2")),
    ]
)
