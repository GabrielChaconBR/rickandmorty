//
//  HttpClientSpy.swift
//  DataTests
//
//  Created by Gabriel Chacon on 11/08/23.
//

import Foundation
import Domain
import Data

class HttpClientSpy: HttpGetClientProtocol {
    
    var urls = [URL]()
    var completion: ((Result<Data?, HttpError>) -> Void)?
    
    func get(to url: URL, completion: @escaping (Result<Data?, HttpError>) -> Void) {
        self.urls.append(url)
        self.completion = completion
    }
    
    func completeWithError(_ error: HttpError) {
        completion?(.failure(error))
    }
    
    func completeWithData(_ data: Data) {
        completion?(.success(data))
    }
}
