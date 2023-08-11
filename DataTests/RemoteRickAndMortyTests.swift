import XCTest

class RemoteRickAndMorty {
    
    private let url: URL
    private let httpClient: HttpGetClient
    
    init(url: URL, httpClient: HttpGetClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func getRickAndMorty() {
        httpClient.get(to: url)
    }
}

protocol HttpGetClient {
    func get(to url: URL)
}

final class RemoteRickAndMortyTests: XCTestCase {
    
    func test_get_should_call_httpClient_with_correct_url() {
        let url = URL(string: "http://something.com")!
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.getRickAndMorty()
        XCTAssertEqual(httpClientSpy.url, url)
    }
}

extension RemoteRickAndMortyTests {
    
    func makeSut(url: URL = URL(string: "http://default.com")!) -> (sut: RemoteRickAndMorty, httpClientSpy: HttpClientSpy) {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteRickAndMorty(url: url, httpClient: httpClientSpy)
        return (sut, httpClientSpy)
    }
    
    class HttpClientSpy: HttpGetClient {
        
        var url: URL?
        
        func get(to url: URL) {
            self.url = url
        }
    }
}
