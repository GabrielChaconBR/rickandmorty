//
//  AlamofireAdapterTests.swift
//  AlamofireAdapterTests
//
//  Created by Gabriel Chacon on 11/08/23.
//

import XCTest
import Alamofire
import Domain
import Infra

class AlamofireAdapterTests: XCTestCase {
    
    func test_get_should_make_request_with_valid_url_and_method() {
        let url = makeUrl()
        testRequestFor(url: url) { request in
            XCTAssertEqual(url, request.url)
            XCTAssertEqual("GET", request.httpMethod)
        }
    }
    
    func test_get_should_complete_with_error_when_completes_with_error() {
        expectResult(.failure(.noConnectivity), when: (nil, nil, makeError()))
    }
    
    func test_get_should_complete_with_error_on_all_invalid_cases() {
        expectResult(.failure(.noConnectivity), when: (makeValidData(), makeHttpResponse(), makeError()))
        expectResult(.failure(.noConnectivity), when: (makeValidData(), nil, makeError()))
        expectResult(.failure(.noConnectivity), when: (makeValidData(), nil, nil))
        expectResult(.failure(.noConnectivity), when: (nil, makeHttpResponse(), makeError()))
        expectResult(.failure(.noConnectivity), when: (nil, makeHttpResponse(), nil))
        expectResult(.failure(.noConnectivity), when: (nil, nil, nil))
    }
    
    func test_get_should_complete_with_data_when_request_completes_with_200() {
        expectResult(.success(makeValidData()), when: (makeValidData(), makeHttpResponse(), nil))
    }
    
    func test_get_should_complete_with_no_data_when_request_completes_with_204() {
        expectResult(.success(nil), when: (nil, makeHttpResponse(statusCode: 204), nil))
        expectResult(.success(nil), when: (makeEmptyData(), makeHttpResponse(statusCode: 204), nil))
        expectResult(.success(nil), when: (makeValidData(), makeHttpResponse(statusCode: 204), nil))
    }
    
    func test_get_should_complete_with_error_when_request_completes_with_non_200() {
        expectResult(.failure(.badRequest), when: (makeValidData(), makeHttpResponse(statusCode: 400), nil))
        expectResult(.failure(.badRequest), when: (makeValidData(), makeHttpResponse(statusCode: 450), nil))
        expectResult(.failure(.badRequest), when: (makeValidData(), makeHttpResponse(statusCode: 499), nil))
        expectResult(.failure(.serverError), when: (makeValidData(), makeHttpResponse(statusCode: 500), nil))
        expectResult(.failure(.serverError), when: (makeValidData(), makeHttpResponse(statusCode: 550), nil))
        expectResult(.failure(.serverError), when: (makeValidData(), makeHttpResponse(statusCode: 599), nil))
        expectResult(.failure(.unauthorized), when: (makeValidData(), makeHttpResponse(statusCode: 401), nil))
        expectResult(.failure(.forbidden), when: (makeValidData(), makeHttpResponse(statusCode: 403), nil))
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
    
    func testRequestFor(url: URL = makeUrl(), action: @escaping (URLRequest) -> Void) {
        let sut = makeSut()
        let exp = expectation(description: "waiting")
        sut.get(to: url) { _ in exp.fulfill()}
        var request: URLRequest?
        UrlProtocolStub.observeRequest { request = $0 }
        wait(for: [exp], timeout: 1)
        action(request!)
    }
    
    func expectResult(_ expectedResult: Result<Data?, HttpError>, when stub: (data: Data?, response: HTTPURLResponse?, error: Error?), file: StaticString = #file, line: UInt = #line) {
        
        let sut = makeSut()
        UrlProtocolStub.simulate(data: stub.data, response: stub.response, error: stub.error)
        let exp = expectation(description: "waiting")
        sut.get(to: makeUrl()) { receivedResult in
            switch (expectedResult, receivedResult) {
            case (.failure(let expectedError), .failure(let receivedError)):
                XCTAssertEqual(expectedError, receivedError, file: file, line: line)
                
            case (.success(let expectedData), .success(let receivedData)):
                XCTAssertEqual(expectedData, receivedData, file: file, line: line)
                
            default:
                XCTFail("Expected \(expectedResult) got \(receivedResult) instead", file: file, line: line)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 2)
    }
}
