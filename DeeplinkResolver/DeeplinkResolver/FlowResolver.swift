import Foundation

struct FlowResolver {
    func resolveDeeplink(components: URLComponents) -> Flow? {
        let (baseUrl, parameters) = DeeplinkParser().parse(url: components)
        switch baseUrl {
        case "/payments/reprocessing":
            let id = parameters["id"]
            return .reprocessing(id: id)
            
        case "/bankslip":
            return .bankslip
            
        case let str where str.starts(with: "/home"),
            let str where str.starts(with: "generic"):
            return .home
            
        default:
            return nil
        }
    }
}
