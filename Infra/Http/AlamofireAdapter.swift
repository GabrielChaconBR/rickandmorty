//
//  AlamofireAdapter.swift
//  Infra
//
//  Created by Gabriel Chacon on 11/08/23.
//

import Foundation
import Alamofire
import Data
import Domain

public final class AlamofireAdapter: HttpGetClientProtocol {
    
    private var session: Session
    
    public init(session: Session = .default) {
        self.session = session
    }
    
    public func get(to url: URL, completion: @escaping (Result<Data?, HttpError>) -> Void) {
        session.request(url).responseData {
            dataResponse in
            guard let statusCode = dataResponse.response?.statusCode else {
                return completion(.failure(.noConnectivity))
            }
            switch dataResponse.result {
            case .failure:
                completion(.failure(.noConnectivity))
            case .success(let data):
                switch statusCode {
                case 204:
                    completion(.success(nil))
                case 200...299:
                    completion(.success(data))
                case 401:
                    completion(.failure(.unauthorized))
                case 403:
                    completion(.failure(.forbidden))
                case 400...499:
                    completion(.failure(.badRequest))
                case 500...599:
                    completion(.failure(.serverError))
                default:
                    completion(.failure(.noConnectivity))
                }
                
            }
        }
    }
}
