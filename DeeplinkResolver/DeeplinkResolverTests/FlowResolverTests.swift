import Foundation
import Quick
import Nimble

@testable import DeeplinkResolver

final class FlowResolverTests: QuickSpec {
    override func spec() {
        var sut: FlowResolver!
        
        beforeEach {
            sut = FlowResolver()
        }
        
        describe("#resolveDeeplink") {
            var result: Flow!
            var componentsMock: URLComponents!
            
            context("deeplink is invalid") {
                beforeEach {
                    componentsMock = URLComponents(string: "invalid")!
                    result = sut.resolveDeeplink(components: componentsMock)
                }
                
                it("returns nil") {
                    expect(result) == nil
                }
            }
            
            context("deeplink is /payments/reprocessing") {
                beforeEach {
                    componentsMock = URLComponents(string: "/payments/reprocessing?id=123")!
                    result = sut.resolveDeeplink(components: componentsMock)
                }
                
                it("returns nil") {
                    expect(result) == .reprocessing(id: "123")
                }
            }
            
            context("deeplink is /bankslip") {
                beforeEach {
                    componentsMock = URLComponents(string: "/bankslip")!
                    result = sut.resolveDeeplink(components: componentsMock)
                }
                
                it("returns nil") {
                    expect(result) == .bankslip
                }
            }
            
            context("deeplink is /home") {
                beforeEach {
                    componentsMock = URLComponents(string: "/home")!
                    result = sut.resolveDeeplink(components: componentsMock)
                }
                
                it("returns nil") {
                    expect(result) == .home
                }
            }
            
            context("deeplink is /generic") {
                beforeEach {
                    componentsMock = URLComponents(string: "/generic")!
                    result = sut.resolveDeeplink(components: componentsMock)
                }
                
                it("returns nil") {
                    expect(result) == .home
                }
            }
        }
    }
}
