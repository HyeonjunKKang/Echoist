
import Foundation
import SwiftUI

public struct LoadFont {
    public static func execute() {
        let fontNames = [
            "Pretendard-Black",
            "Pretendard-Bold",
            "Pretendard-ExtraBold",
            "Pretendard-ExtraLight",
            "Pretendard-Light",
            "Pretendard-Medium",
            "Pretendard-Regular",
            "Pretendard-SemiBold",
            "Pretendard-Thin"
        ]
        
        let fontExtension = "ttf"

        fontNames.forEach { fontName in
            self.loadFont(withName: fontName, extension: fontExtension)
        }
    }
    
    private static func loadFont(withName name: String, extension fontExtension: String) {
        guard let fontURL = Bundle.module.url(forResource: name, withExtension: fontExtension) else {
            print("Font \(name) not found in bundle.")
            return
        }

        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            print("Unable to create font data provider for \(name).")
            return
        }

        var error: Unmanaged<CFError>?
        if CTFontManagerRegisterGraphicsFont(font, &error) == false {
            print("Error registering font \(name): \(error!.takeRetainedValue())")
        }
    }
}
