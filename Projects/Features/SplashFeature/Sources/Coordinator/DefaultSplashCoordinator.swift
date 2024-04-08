

import UIKit
import ComposableArchitecture
import SwiftUI

import Core
import Shared


public final class DefaultSplashCoordinator: SplashCoordinator {
    
    public var finishDelegate: CoordinatorFinishDelegate?
    public var splashFinishDelegate: SplashFinishDelegate?
    
    public var navigationController: UINavigationController
    
    public var childCoordinators = [Coordinator]()
    
    public var type: CoordinatorType = .splash
    
    public init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let splashView = UIHostingController(rootView: SplashView(store: .init(initialState: SplashStore.State(), reducer: {
            SplashStore(coordinator: self)
        })))
        
        navigationController.pushViewController(splashView, animated: false)
        
    }
    
    public func splashEnded(_ type: SplashType) {
        splashFinishDelegate?.finish(type)
        self.finish()
    }
}
