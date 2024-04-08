//
//import ComposableArchitecture
//import SwiftUI
//import MainFeatureInterface
//import Shared
//import Core
//
//public final class DefaultMainCoordinator: MainCoordinator {
//    public var finishDelegate: CoordinatorFinishDelegate?
//    
//    public var navigationController: UINavigationController
//    
//    public var childCoordinators = [Coordinator]()
//    
//    public var type: CoordinatorType = .main
//    
//    public init(
//        navigationController: UINavigationController
//    ) {
//        self.navigationController = navigationController
//    }
//    
//    public func start() {
//        
//        let mandalartCoordinator = DefaultMandalartCoordinator(navigationController: navigationController)
//        mandalartCoordinator.mandalartDelegate = self
//        childCoordinators.append(mandalartCoordinator)
//        
//        let settingCoordinator = DefaultSettingCoordinator(navigationController: navigationController)
//        childCoordinators.append(settingCoordinator)
//        
//        let mainView = UIHostingController(rootView: MainView(
//            store: .init(initialState: MainStore.State(), reducer: {
//                MainStore(coordinator: self)
//            }),
//            mandalartView: mandalartCoordinator.start(),
//            settingView: settingCoordinator.start())
//        )
//        
//        navigationController.pushViewController(mainView, animated: false)
//    }
//    
//    func makeChildCoordinator() {
//        
//    }
//    
//}
//
//// Mandalart Delegate
//extension DefaultMainCoordinator: MandalartDelegate {
//    public func pushToMandalartEdit(_ order: Int) {
//        let madalarEditortView = MandalartEditorView(store:
//                .init(
//                    initialState: MandalartEditorStore.State(selectedCardNumber: order),
//                    reducer: {
//                        MandalartEditorStore(coordinator: self)
//                    }
//                ))
//        
//        let mandalartEditorViewController = UIHostingController(rootView: madalarEditortView)
//        
//        navigationController.pushViewController(mandalartEditorViewController, animated: true)
//    }
//}
