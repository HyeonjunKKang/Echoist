
import SwiftUI

public struct TextFieldView: View {
    
    let placeHolder: String
    @State private var goal: String = ""
    @State private var isEditing = false
    
    public init(
        placeHolder: String
    ) {
        self.placeHolder = placeHolder
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text("목표")
                .font(.bodyMedium)
                .foregroundColor(hexColor("#00000073"))
            
            TextField(placeHolder, text: $goal, onEditingChanged: { editing in
                isEditing = editing
            })
                .font(.bodyMedium)
                .padding(.horizontal, 16)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(
                            isEditing
                            ? hexColor("#F4AB1D")
                            : hexColor("#0000001A")
                            , lineWidth: 1)
                        .frame(height: 56)
                )
                .frame(height: 56)
                
        }
    }
}

#Preview {
    TextFieldView(placeHolder: "플레이스 홀더")
}
