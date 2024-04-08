import ComposableArchitecture
import SwiftUI
import Core

public struct MainStore: Reducer {
    
    var coordinator: MainCoordinator?
    
    public struct State: Equatable {
        
        public init() {}
    }
    
    public enum Action: Equatable {
        case onAppear
    }
    
    public init(
        coordinator: MainCoordinator
    ) {
        self.coordinator = coordinator
    }
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none
            }
        }
    }
}
