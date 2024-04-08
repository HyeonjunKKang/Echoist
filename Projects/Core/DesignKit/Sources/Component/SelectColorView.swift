
import SwiftUI
import Shared

public struct SelectColorView: View {
    
    @Binding var isSelected: Bool
    var selectedColor: SelectColorType?
    private var tappedButton: () -> Void
    
    public init(
        isSelected: Binding<Bool>,
        selectedColor: SelectColorType?,
        tappedButton: @escaping () -> Void
        
    ) {
        self._isSelected = isSelected
        self.selectedColor = selectedColor
        self.tappedButton = tappedButton
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text("컬러 선택")
                .font(.bodyMedium)
                .foregroundColor(hexColor("#00000073"))
            
            Button(action: {
                tappedButton()
            }, label: {
                makeButton()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(
                            isSelected
                            ? hexColor("#F4AB1D")
                            : hexColor("#0000001A"),
                            lineWidth: 1)
                        .frame(height: 56)
                )
                .frame(height: 56)
            })
            
        }
        .padding(.top, 24)
    }
}

extension SelectColorView {
    @ViewBuilder
    func makeButton() -> some View {
        HStack {
            if let selectedColor {
                Rectangle()
                    .fill(hexColor(selectedColor.displayColor))
                    .frame(width: 24, height: 24)
                    .cornerRadius(4)
                    .padding(.leading, 16)
                
                Text(selectedColor.displayName)
                    .font(.bodySmall)
                    .foregroundColor(hexColor("#000000B2"))
            } else {
                Text("컬러를 선택하세요")
                    .font(.bodyMedium)
                    .foregroundColor(
                        isSelected
                        ? hexColor("#F4AB1D")
                        : hexColor("#00000073")
                    )
                    .padding(.horizontal, 16)
            }
            
            
            
            Spacer()
            
            Image.expand_more
                .resizable()
                .frame(width: 24, height: 24)
                .tint(
                    isSelected
                    ? hexColor("#F4AB1D")
                    : hexColor("#00000073")
                )
                .rotationEffect(.degrees(isSelected ? 180 : 360))
                .animation(.easeInOut, value: isSelected)
                .padding(.trailing, 16)
        }
    }
}

#Preview {
    SelectColorView(isSelected: .constant(true),
                    selectedColor: .eggtart,
                    tappedButton: {})
}
