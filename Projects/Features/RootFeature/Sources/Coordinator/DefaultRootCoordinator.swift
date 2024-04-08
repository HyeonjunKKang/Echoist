import ComposableArchitecture
import SwiftUI
import SplashFeature
import MainFeature
import MainFeatureInterface
import Shared
import Core

public final class DefaultRootCoordinator: Coordinator {
    
    public var finishDelegate: Core.CoordinatorFinishDelegate?
    
    public var navigationController: UINavigationController
    
    public var childCoordinators: [Core.Coordinator] = []
    
    public var type: Core.CoordinatorType = .root
    
    public func start() {
        
        startSplashFlow()
    }
    
    private func startSplashFlow() {
                
        let splash = DefaultSplashCoordinator(
            navigationController: navigationController,
            splashFinishDelegate: self
        )
        
        addChildCoordinator(splash)
    }
    
    public func startMainFlow() {
        let mainCoordinator = DefaultMainCoordinator(
            finishDelegate: self,
            navigationController: navigationController
        )
        
        addChildCoordinator(mainCoordinator)
    }
    
    public init(
        _ navigationController: UINavigationController,
        childCoordinators: [Core.Coordinator] = [],
        type: Core.CoordinatorType = .root
    ) {
        self.navigationController = navigationController
        self.childCoordinators = childCoordinators
        self.type = type
    }
}

extension DefaultRootCoordinator: SplashFinishDelegate {
    public func finish(_ type: SplashEndType) {
        
        switch type {
        case .goLogin:
            break
        case .goMain:
            startMainFlow()
        }
        
    }
}

extension DefaultRootCoordinator: MainFinishDelegate {
    public func coordinatorDidFinish(childCoordinator: Core.Coordinator) {
        
    }
}
