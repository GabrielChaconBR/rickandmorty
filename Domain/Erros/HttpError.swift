//
//  HttpError.swift
//  Domain
//
//  Created by Gabriel Chacon on 11/08/23.
//

import Foundation

public enum HttpError: Error {
    case noConnectivity
    case badRequest
    case serverError
    case unauthorized
    case forbidden
}
