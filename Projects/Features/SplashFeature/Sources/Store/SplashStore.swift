

import Foundation

import ComposableArchitecture
import Shared
import Core

public final class SplashStore: Reducer {
    
    var coordinator: SplashCoordinator?
    
    public struct State {
        
    }
    
    public enum Action {
        case splashEnded(SplashType)
    }
    
    public init(coordinator: SplashCoordinator?) {
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
