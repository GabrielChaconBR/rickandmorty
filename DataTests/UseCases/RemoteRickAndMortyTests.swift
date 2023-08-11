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
    
    func test_get_should_complete_with_error_if_client_completes_with_error() {
        let (sut, httpClientSpy) = makeSut()
        let exp = expectation(description: "waiting")
        sut.getRickAndMorty() { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .unexpected)
            case .success:
                XCTFail("Expected error receive \(result) instead")
            }
            exp.fulfill()
        }
        httpClientSpy.completeWithError(.noConnectivity)
        wait(for: [exp], timeout: 2)
    }
    
    func test_get_should_complete_with_data_if_client_completes_with_data() {
        let (sut, httpClientSpy) = makeSut()
        let exp = expectation(description: "waiting")
        let expectedRickAndMorty = makeRickAndMortyModel()
        sut.getRickAndMorty() { result in
            switch result {
            case .failure:
                XCTFail("Expected success receive \(result) instead")
            case .success(let receivedRickAndMorty):
                XCTAssertEqual(receivedRickAndMorty, expectedRickAndMorty)
            }
            exp.fulfill()
        }
        httpClientSpy.completeWithData(expectedRickAndMorty.toData()!)
        wait(for: [exp], timeout: 2)
    }
}

extension RemoteRickAndMortyTests {
    
    func makeSut(url: URL = URL(string: "http://default.com")!) -> (sut: RemoteRickAndMorty, httpClientSpy: HttpClientSpy) {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteRickAndMorty(url: url, httpClient: httpClientSpy)
        return (sut, httpClientSpy)
    }
    
    func makeRickAndMortyModel() -> RickAndMortyModel {
        RickAndMortyModel(characters: "http://characters-url.com")
    }
    
    class HttpClientSpy: HttpGetClientProtocol {
        
        var urls = [URL]()
        var completion: ((Result<Data, HttpError>) -> Void)?
        
        func get(to url: URL, completion: @escaping (Result<Data, HttpError>) -> Void) {
            self.urls.append(url)
            self.completion = completion
        }
        
        func completeWithError(_ error: HttpError) {
            completion?(.failure(error))
        }
        
        func completeWithData(_ data: Data) {
            completion?(.success(data))
        }
    }
}
