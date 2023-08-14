import Foundation

public struct WelcomeModel: Model {

    public let results: [ResultModel]
    
    public init(results: [ResultModel]) {
        self.results = results
    }
}
