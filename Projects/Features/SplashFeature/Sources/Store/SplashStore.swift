

import Foundation

import ComposableArchitecture
import Shared
import Core

public final class SplashStore: Reducer {
    
    var coordinator: DefaultSplashCoordinator?
    
    public struct State {
        
    }
    
    public enum Action {
        case splashEnded(SplashEndType)
    }
    
    public init(coordinator: DefaultSplashCoordinator?) {
        self.coordinator = coordinator
    }
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .splashEnded(let endType):
                self.coordinator?.splashEnded(endType)
                return .none
            }
        }
    }
}
