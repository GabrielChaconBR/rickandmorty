import Foundation

public struct WelcomeModel: Model {

    let results: [ResultModel]
    
    public init(results: [ResultModel]) {
        self.results = results
    }
}
