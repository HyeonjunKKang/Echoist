

import SwiftUI
import Shared

public struct ColorSheet: View {
    
    let colorList = SelectColorType.allCases
    let selectColor: (SelectColorType) -> Void
    public init(
        _ selectColor: @escaping (SelectColorType) -> Void
    ) {
        self.selectColor = selectColor
    }
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(colorList, id: \.self) { color in
                    Button(action: {
                        selectColor(color)
                    }, label: {
                        HStack(spacing: 12) {
                            Rectangle()
                                .fill(hexColor(color.displayColor))
                                .frame(width: 24, height: 24)
                                .cornerRadius(4)
                            
                            Text(color.displayName)
                                .font(.bodySmall)
                                .foregroundColor(hexColor("#000000B2"))
                            
                            Spacer()
                        }
                        .padding(.all, 16)
                        .frame(height: 56)
                        .contentShape(Rectangle())
                        
                    })
                    .buttonStyle(
                        ColorSheetButtonStyle()
                    )
                }
            }
            
        }
    }
}

struct ColorSheetButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .background(
                configuration.isPressed
                ? hexColor("#0000000D")
                : .clear
            )
    }
}

#Preview {
    ColorSheet({_ in })
}
