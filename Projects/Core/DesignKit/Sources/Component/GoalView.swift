
import SwiftUI
import Shared

public struct GoalView: View {
    let mandalartLocationType: MandalartLocationType
    let goal: String = "먼저 최종\n목표를\n입력해 주세요"
    
    public init(
        _ mandalartLocationType: MandalartLocationType
    ) {
        self.mandalartLocationType = mandalartLocationType
    }
    
    public var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(backgroundColor)
            .aspectRatio(1, contentMode: .fit)
            .overlay(
                overlayView()
            )
    }
    
    private var backgroundColor: Color {
        switch mandalartLocationType {
        case .center:
            return hexColor("#0000001A")
        case .other:
            return hexColor("#0000000A")
        }
    }
    
    @ViewBuilder
    private func overlayView() -> some View {
        switch mandalartLocationType {
        case .center:
            Text(goal)
                .font(.bodyMedium)
                .padding(.all, 8)
                .foregroundColor(hexColor("#00000073"))
            
        case .other:
            Image.add
                .resizable()
                .frame(width: 24, height: 24)
        }
    }
}
