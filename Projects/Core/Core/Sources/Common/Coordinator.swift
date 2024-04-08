import Foundation
import UIKit
import SwiftUI

public protocol Coordinator: AnyObject {
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    var type: CoordinatorType { get }
    
    func start()
    func addChildCoordinator(_ child: Coordinator)
    func finish()
    func findChildCoordinator(_ type: CoordinatorType) -> Coordinator?
}

public extension Coordinator {
    
    func finish() {
        print("\(self) will remove ")
        
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
        navigationController.viewControllers = []
        
        print("\(self) removed ")

    }
    
    func findChildCoordinator(_ type: CoordinatorType) -> Coordinator? {
        
        if let index = childCoordinators.firstIndex(where: { $0.type == type }) {
            return childCoordinators[index]
        } else {
            return nil
        }
        
    }
    
    func addChildCoordinator(_ child: Coordinator) {
        print("\(child) will Start")
        
        if let self = self as? CoordinatorFinishDelegate {
            child.finishDelegate = self
        }
        childCoordinators.append(child)
        child.start()
        
        print("\(child) Started")
    }
    
    func push(
        _ viewController: UIViewController,
        isRoot: Bool = false,
        isAnimating: Bool = true
    ) {
        if isRoot {
            navigationController.viewControllers = []
            navigationController.pushViewController(viewController, animated: isAnimating)
        } else {
            navigationController.pushViewController(viewController, animated: isAnimating)
        }
    }
}


