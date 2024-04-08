
import Foundation

enum FontType {
    case pretendardBlack
    case pretendardBold
    case pretendardExtraBold
    case pretendardExtraLight
    case pretendardLight
    case pretendardMedium
    case pretendardRegualr
    case pretendardSemibold
    case pretendardThin
    
    var toString: String {
        switch self {
        case .pretendardBlack:
            return "Pretendard-Black"
        case .pretendardBold:
            return "Pretendard-Bold"
        case .pretendardExtraBold:
            return "Pretendard-ExtraBold"
        case .pretendardExtraLight:
            return "Pretendard-ExtraLight"
        case .pretendardLight:
            return "Pretendard-Light"
        case .pretendardMedium:
            return "Pretendard-Medium"
        case .pretendardRegualr:
            return "Pretendard-Regular"
        case .pretendardSemibold:
            return "Pretendard-SemiBold"
        case .pretendardThin:
            return "Pretendard-Thin"
        }
    }
}
