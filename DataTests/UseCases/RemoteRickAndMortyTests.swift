import XCTest
import Domain
import Data

final class RemoteRickAndMortyTests: XCTestCase {
    
    func test_get_should_call_httpClient_with_correct_url() {
        let url = URL(string: "http://something.com")!
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.getRickAndMorty() { _ in }
        XCTAssertEqual(httpClientSpy.urls, [url])
    }
    
    func test_get_should_complete_with_error_if_client_fails() {
        let (sut, httpClientSpy) = makeSut()
        let exp = expectation(description: "waiting")
        sut.getRickAndMorty() { error in
            XCTAssertEqual(error, .unexpected)
            exp.fulfill()
        }
        httpClientSpy.completeWithError(.noConnectivity)
        wait(for: [exp], timeout: 2)
    }
}

extension RemoteRickAndMortyTests {
    
    func makeSut(url: URL = URL(string: "http://default.com")!) -> (sut: RemoteRickAndMorty, httpClientSpy: HttpClientSpy) {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteRickAndMorty(url: url, httpClient: httpClientSpy)
        return (sut, httpClientSpy)
    }
    
    class HttpClientSpy: HttpGetClientProtocol {
        
        var urls = [URL]()
        var completion: ((HttpError) -> Void)?
        
        func get(to url: URL, completion: @escaping (HttpError) -> Void) {
            self.urls.append(url)
            self.completion = completion
        }
        
        func completeWithError(_ error: HttpError) {
            completion?(error)
        }
    }
}
