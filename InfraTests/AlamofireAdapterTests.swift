//
//  AlamofireAdapterTests.swift
//  AlamofireAdapterTests
//
//  Created by Gabriel Chacon on 11/08/23.
//

import XCTest
import Alamofire

class AlamofireAdapter {
    
    private var session: Session
    
    init(session: Session = .default) {
        self.session = session
    }
    
    func get(to url: URL) {
        session.request(url).resume()
    }
}

class AlamofireAdapterTests: XCTestCase {
    
    func test_get_should_make_request_with_valid_url_and_method() {
        let url = makeUrl()
        let sut = makeSut()
        sut.get(to: url)
        let exp = expectation(description: "waiting")
        UrlProtocolStub.observeRequest { request in
            XCTAssertEqual(url, request.url)
            XCTAssertEqual("GET", request.httpMethod)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
}

extension AlamofireAdapterTests {
    
    func makeSut(file: StaticString = #file, line: UInt = #line) -> AlamofireAdapter {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [UrlProtocolStub.self]
        let session = Session(configuration: configuration)
        let sut = AlamofireAdapter(session: session)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}

class UrlProtocolStub: URLProtocol {
    
    static var emit: ((URLRequest) -> Void)?
    
    static func observeRequest(completion: @escaping (URLRequest) -> Void) {
        UrlProtocolStub.emit = completion
    }

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        UrlProtocolStub.emit?(request)
    }
    
    override func stopLoading() {}
}
