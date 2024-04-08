
import SwiftUI
import Shared

public struct CommonButton: View {
    
    private var configuration: ButtonConfiguration
    
    fileprivate init(_ configuration: ButtonConfiguration) {
        self.configuration = configuration
    }
    
    public init(
        _ text: String,
        tappedButton: @escaping () -> Void
    ) {
        configuration = ButtonConfiguration(
            text: text,
            size: .large,
            style: .normal,
            tappedButton: tappedButton
        )
    }
    
    public var body: some View {
        
        Button(action: {
            configuration.tappedButton()
        }, label: {
            Text(configuration.text)
                .font(configuration.size.font)
                .foregroundColor(configuration.style.foregroundColor)
                .frame(maxWidth: .infinity)
                
        })
        .buttonStyle(MyButtonStyle(buttonConfiguration: configuration))
        .frame(height: 51)
        .padding(.horizontal, 20)
        .padding(.top, 8)
        .padding(.bottom, 28)
    }
}

public extension CommonButton {
    func size(_ size: CommonButtonSize) -> CommonButton {
        
        var newConfig = self.configuration
        
        newConfig.size = size
        
        return CommonButton(newConfig)
    }
    
    func style(_ style: CommonButtonStyle) -> CommonButton {
        
        var newConfig = self.configuration
        
        newConfig.style = style
        
        return CommonButton(newConfig)
    }
}

struct MyButtonStyle: ButtonStyle {
    
    var buttonConfiguration: ButtonConfiguration
    
    @Environment(\.isEnabled) var isEnabled: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .background(
                getBackgroundColor(configuration)
            )
            .cornerRadius(8.0)
    }
    
    
    private func getBackgroundColor(_ configuration: Configuration) -> Color {
        if !isEnabled {
            buttonConfiguration.style.disableColor
        } else if configuration.isPressed {
            buttonConfiguration.style.highlightColor
        } else {
            buttonConfiguration.style.backgroundColor
        }
    }
}
