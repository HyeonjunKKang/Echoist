
import SwiftUI


public extension Color {
    
}

// Hex 변환
public func hexColor(_ hex: String) -> Color {
    var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.removeFirst()
    }

    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    var red: CGFloat  = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 1.0
    
    if (cString.count == 6) {
        // 6자리 hexString일 경우, 알파값을 1로 설정
        red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        blue = Double(rgbValue & 0x0000FF) / 255.0
        return Color(.sRGB, red: red, green: green, blue: blue, opacity: 1.0)
    } else {
        red = Double((rgbValue & 0xFF000000) >> 24) / 255.0
        green = Double((rgbValue & 0x00FF0000) >> 16) / 255.0
        blue = Double((rgbValue & 0x0000FF00) >> 8) / 255.0
        alpha = Double(rgbValue & 0x000000FF) / 255.0
        return Color(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}

