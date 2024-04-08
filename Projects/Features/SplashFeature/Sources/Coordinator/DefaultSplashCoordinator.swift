import UIKit
import ComposableArchitecture
import SwiftUI
import Core
import Shared

public enum SplashEndType {
    case goLogin
    case goMain
}

public final class DefaultSplashCoordinator: Coordinator {
    
    public weak var finishDelegate: CoordinatorFinishDelegate?
    public weak var splashFinishDelegate: SplashFinishDelegate?
    
    public var navigationController: UINavigationController
    
    public var childCoordinators = [Coordinator]()
    
    public var type: CoordinatorType = .splash
    
    public init(
        navigationController: UINavigationController,
        splashFinishDelegate: SplashFinishDelegate
    ) {
        self.navigationController = navigationController
        self.splashFinishDelegate = splashFinishDelegate
    }
    
    public func start() {
                
        let splashView = UIHostingController(
            rootView: SplashView(
                store: .init(initialState: SplashStore.State(),
                             reducer: {
                                 SplashStore(coordinator: self)
                             })
            )
        )
        
        push(splashView, isRoot: true, isAnimating: false)
        
    }
    
    public func splashEnded(_ type: SplashEndType) {
        navigationController.viewControllers.removeAll()
        self.finish()
        
        splashFinishDelegate?.finish(type)
    }
}
