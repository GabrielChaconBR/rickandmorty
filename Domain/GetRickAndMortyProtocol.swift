import Foundation

protocol GetRickAndMortyProtocol {
    func getRickAndMorty(completion: @escaping (Result<RickAndMortyModel, Error>) -> Void)
}
