import Foundation

final class Coordinator {
    let flow: Flow
    init(deeplink: URLComponents) {
        flow = FlowResolver().resolveDeeplink(components: deeplink) ?? .bankslip
    }
    
    func start() {
        switch flow {
        case let .reprocessing(id):
            print("reprocessing \(id ?? "failure id")")
        case .bankslip:
            print("bankslip")
        case .home:
            print("home")
        }
    }
}
