//
//  TestUtils.swift
//  DataTests
//
//  Created by Gabriel Chacon on 11/08/23.
//

import Foundation

func makeUrl() -> URL {
    URL(string: "http://something.com")!
}

func makeValidData() -> Data {
    Data("{\"url\":\"something.com\"}".utf8)
}

func makeEmptyData() -> Data {
    Data()
}

func makeInvalidData() -> Data {
    Data("invalid_data".utf8)
}

func makeError() -> Error {
    NSError(domain: "some-error", code: 0)
}

func makeHttpResponse(statusCode: Int = 200) -> HTTPURLResponse {
    HTTPURLResponse(url: makeUrl(), statusCode: statusCode, httpVersion: nil, headerFields: nil)!
}
