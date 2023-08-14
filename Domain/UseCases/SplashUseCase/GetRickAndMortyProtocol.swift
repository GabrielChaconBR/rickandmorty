import Foundation

public protocol GetRickAndMortyProtocol {
    func getRickAndMorty(completion: @escaping (Result<RickAndMortyModel, DomainError>) -> Void)
}

