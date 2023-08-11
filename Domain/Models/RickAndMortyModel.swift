import Foundation

public struct RickAndMortyModel: Model {
    
    public var characters: String
    
    public init(characters: String) {
        self.characters = characters
    }
}
