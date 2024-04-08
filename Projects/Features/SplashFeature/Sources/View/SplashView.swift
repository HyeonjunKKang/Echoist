import SwiftUI
import ComposableArchitecture
import Shared

struct SplashView: View {
    
    var store: StoreOf<SplashStore>
    
    var body: some View {
        Text("Splash")
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.store.send(.splashEnded(.mainFeature))
                }
            })
    }
}

#Preview {
    SplashView(store: .init(initialState: SplashStore.State(), reducer: {
        SplashStore(coordinator: nil)
    }))
}
