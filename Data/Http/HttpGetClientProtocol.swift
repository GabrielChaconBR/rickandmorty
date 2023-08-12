//
//  HttpGetClientProtocol.swift
//  Data
//
//  Created by Gabriel Chacon on 11/08/23.
//

import Foundation
import Domain

public protocol HttpGetClientProtocol {
    func get(to url: URL, completion: @escaping (Result<Data?, HttpError>) -> Void)
}
