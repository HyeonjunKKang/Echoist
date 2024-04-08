
import Foundation
import SwiftUI

public struct ButtonConfiguration {
    public var text: String
    public var size: CommonButtonSize
    public var style: CommonButtonStyle
    public var tappedButton: () -> Void
    
    public init(
        text: String,
        size: CommonButtonSize,
        style: CommonButtonStyle,
        tappedButton: @escaping () -> Void
    ) {
        self.text = text
        self.size = size
        self.style = style
        self.tappedButton = tappedButton
    }
}

public enum CommonButtonSize {
    case large
    case small
    
    var font: Font {
        switch self {
        case .large:
            return Font.labelLarge
        case .small:
            return Font.labelSmall
        }
    }
}

public enum CommonButtonStyle {
    case normal
    case empty
    
    var foregroundColor: Color {
        switch self {
        case .normal:
            return hexColor("#FFFFFF")
        case .empty:
            return hexColor("#000000B2")
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .normal:
            return hexColor("#F4AB1D")
        case .empty:
            return .clear
        }
    }
    
    var disableColor: Color {
        switch self {
        case .normal:
            return hexColor("#DCDCDC")
        case .empty:
            return hexColor("#00000026")
        }
    }
    
    var highlightColor: Color {
        switch self {
        case .normal:
            return hexColor("#CF9119")
        case .empty:
            return .clear
        }
    }
    
    
}
