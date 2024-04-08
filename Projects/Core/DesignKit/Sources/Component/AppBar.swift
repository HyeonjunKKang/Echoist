
import SwiftUI

public func makeAppBar(title: String) -> some View {
    HStack {
        Spacer()
        
        Text(title)
            .font(.titleMedium)
            .foregroundStyle(hexColor("#000000B2"))
        
        Spacer()
    }
    .frame(height: 56)
}
