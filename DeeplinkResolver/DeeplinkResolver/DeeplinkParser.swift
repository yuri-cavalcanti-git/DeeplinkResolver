import Foundation

protocol DeeplinkParserType {
    func parse(url: URLComponents) -> (feature: String,
                                       parameters: [String: String])
}

struct DeeplinkParser: DeeplinkParserType {
    func parse(url: URLComponents) -> (feature: String, parameters: [String : String]) {
        let feature = url.path // separa o path
        
        var parameters: [String: String] = [:]
        url.queryItems?.forEach { item in
            if let value = item.value {
                parameters.updateValue(value, forKey: item.name)
            }
        }
        
        return (feature: feature, parameters: parameters)
    }
}
