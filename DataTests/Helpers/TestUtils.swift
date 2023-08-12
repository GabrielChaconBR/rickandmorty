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

func makeInvalidData() -> Data {
    Data("invalid_data".utf8)
}

func makeError() -> Error {
    NSError(domain: "some-error", code: 0)
}
