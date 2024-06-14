import Foundation
import Quick
import Nimble

@testable import DeeplinkResolver

final class DeeplinkParserTests: QuickSpec {
    override func spec() {
        var sut: DeeplinkParser!
        
        beforeEach {
            sut = DeeplinkParser()
        }
        
        describe("#parse") {
            context("when has two parameters") {
                var feature = ""
                var parameters: [String: String] = [:]
                
                beforeEach {
                    let url = URLComponents(string: "/payments/reprocessing?id=123&type=bankslip")!
                    (feature, parameters) = sut.parse(url: url)
                }
                
                it("returns /payments/reprocessing as feature") {
                    expect(feature) == "/payments/reprocessing"
                }
                
                it("returns expected parameters") {
                    let expectedParameters = [
                        "id": "123",
                        "type": "bankslip"
                    ]
                    
                    expect(parameters) == expectedParameters
                }
            }
            
            context("when has one parameters") {
                var feature = ""
                var parameters: [String: String] = [:]
                
                beforeEach {
                    let url = URLComponents(string: "/payments/reprocessing?id=123")!
                    (feature, parameters) = sut.parse(url: url)
                }
                
                it("returns /payments/reprocessing as feature") {
                    expect(feature) == "/payments/reprocessing"
                }
                
                it("returns expected parameters") {
                    let expectedParameters = [
                        "id": "123"
                    ]
                    
                    expect(parameters) == expectedParameters
                }
            }
            
            context("when has no parameters") {
                var feature = ""
                var parameters: [String: String] = [:]
                
                beforeEach {
                    let url = URLComponents(string: "/payments/reprocessing")!
                    (feature, parameters) = sut.parse(url: url)
                }
                
                it("returns /payments/reprocessing as feature") {
                    expect(feature) == "/payments/reprocessing"
                }
                
                it("returns expected parameters") {
                    expect(parameters.isEmpty) == true
                }
            }
        }
    }
}
