import ComposableArchitecture
import SwiftUI
import SplashFeature
import MainFeature
import MainFeatureInterface
import Shared
import Core

public final class DefaultRootCoordinator: RootCoordinator {
    
    public var finishDelegate: CoordinatorFinishDelegate?
    public var splashFinishDelegate: SplashFinishDelegate?
    
    public var navigationController: UINavigationController
    
    public var childCoordinators = [Coordinator]()
    
    public var type: CoordinatorType = .root
    
    public init(
        _ navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }
    
    public func start() {
        startSplashFlow()
    }
    
    public func startLoginFlow() {
        print("start login")
    }
    
    public func startMainFlow() {
        let mainCoordinator = DefaultMainCoordinator(
            navigationController: navigationController
        )
        
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }
    
    public func startSplashFlow() {
        let splashCoordinator = DefaultSplashCoordinator(
            navigationController: navigationController
        )
        
        childCoordinators.append(splashCoordinator)
        splashCoordinator.splashFinishDelegate = self
        splashCoordinator.start()
    }
}

extension DefaultRootCoordinator: SplashFinishDelegate {
    public func finish(_ type: SplashType) {
        
        navigationController.viewControllers.removeAll()
        
        switch type {
        case .mainFeature:
            startMainFlow()
        case .loginFeature:
            startLoginFlow()
        }
    }
}
