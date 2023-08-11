import XCTest

class RemoteRickAndMorty {
    
    private let url: URL
    private let httpClient: HttpGetClient
    
    init(url: URL, httpClient: HttpGetClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func getRickAndMorty() {
        httpClient.get(url: self.url)
    }
}

protocol HttpGetClient {
    func get(url: URL)
}

final class RemoteRickAndMortyTests: XCTestCase {
    
    func test_() {
        let url = URL(string: "http://something.com")!
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteRickAndMorty(url: url, httpClient: httpClientSpy)
        sut.getRickAndMorty()
        XCTAssertEqual(httpClientSpy.url, url)
    }
    
    class HttpClientSpy: HttpGetClient {
        
        var url: URL?
        
        func get(url: URL) {
            self.url = url
        }
    }

}
