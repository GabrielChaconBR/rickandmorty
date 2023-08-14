import Foundation

public protocol GetListRickAndMortyProtocol {
    func getListRickAndMorty(completion: @escaping (Result<WelcomeModel, DomainError>) -> Void)
}

