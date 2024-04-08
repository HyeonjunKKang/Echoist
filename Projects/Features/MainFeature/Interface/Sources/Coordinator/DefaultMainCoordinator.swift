//
//  DefaultMainCoordinator.swift
//  MainFeatureInterface
//
//  Created by 강현준 on 4/8/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import UIKit
import SwiftUI
import Core
import ComposableArchitecture

public class DefaultMainCoordinator: Coordinator {
    
    public var finishDelegate: Core.CoordinatorFinishDelegate?
    
    public var navigationController: UINavigationController
    
    public var childCoordinators: [Core.Coordinator]
    
    public var type: Core.CoordinatorType = .main
    
    public init(
        finishDelegate: Core.CoordinatorFinishDelegate?,
        navigationController: UINavigationController,
        childCoordinators: [Core.Coordinator] = []
    ) {
        self.finishDelegate = finishDelegate
        self.navigationController = navigationController
        
        self.childCoordinators = childCoordinators
    }
    
    public func start() {
        startMainFlow()
    }
    
    public func startMainFlow() {
        let VC = UIHostingController(
            rootView:
                MainView(
                    store: .init(
                        initialState: Search.State(),
                        reducer: {
                            return Search()
                        })
                )
        )
        
        push(VC, isRoot: true, isAnimating: false)
    }
}
