

import UIKit

public protocol Coordinator: AnyObject {
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    var type: CoordinatorType { get }
    
    func start()
    func finish()
    func findCoordinator(_ type: CoordinatorType) -> Coordinator?
}

public extension Coordinator {
    
    func finish() {
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
        
        print("remove after child coordinators : \(childCoordinators)")
    }
    
    func findCoordinator(_ type: CoordinatorType) -> Coordinator? {
        var coordinators: [Coordinator] = [self]
        
        if let index = coordinators.firstIndex(where: { $0.type == type }) {
            return coordinators[index]
        } else {
            return nil
        }
        
    }
}
