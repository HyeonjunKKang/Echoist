
import SwiftUI
import ComposableArchitecture

import SettingFeatureInterface
import DesignKit
import Shared

public struct MainView: View {
    
    let store: StoreOf<MainStore>
    let mandalartView: AnyView
    let settingView: AnyView
    
    @State private var selectedTab: TabBarType = .mandalart
    
    public init(
        store: StoreOf<MainStore>,
        mandalartView: AnyView,
        settingView: AnyView
    ) {
        self.store = store
        self.mandalartView = mandalartView
        self.settingView = settingView
    }
    
    public var body: some View {
        
        TabView(selection: $selectedTab){
            VStack {
                Spacer()
                mandalartView
                Spacer()
                Divider()
            }
            .tabItem {
                selectedTab == .mandalart
                ? Image.gridOn
                : Image.gridOff
                
                Text("만다르트")
                    .font(.labelSmall)
            }
            .tag(TabBarType.mandalart)
            
            VStack {
                Spacer()
                settingView
                Spacer()
                Divider()
            }
            .tabItem {
                selectedTab == .setting
                ? Image.settingsOn
                : Image.settingsOff
                
                Text("설정")
                    .font(.labelSmall)
            }
            .tag(TabBarType.setting)
        }
        .accentColor(.black)
        
    }
}
