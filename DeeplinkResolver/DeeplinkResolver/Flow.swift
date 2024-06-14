import Foundation

enum Flow: Equatable {
    case reprocessing(id: String?)
    case bankslip
    case home
}
