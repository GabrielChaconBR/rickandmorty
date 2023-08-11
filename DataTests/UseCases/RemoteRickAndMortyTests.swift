import XCTest
import Domain
import Data

final class RemoteRickAndMortyTests: XCTestCase {
    
    func test_get_should_call_httpClient_with_correct_url() {
        let url = makeUrl()
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.getRickAndMorty() { _ in }
        XCTAssertEqual(httpClientSpy.urls, [url])
    }
    
    func test_get_should_complete_with_error_if_client_completes_with_error() {
        let (sut, httpClientSpy) = makeSut()
        expect(sut, completeWith: .failure(.unexpected), when: {
            httpClientSpy.completeWithError(.noConnectivity)
        })
    }
    
    func test_get_should_complete_with_data_if_client_completes_with_valid_data() {
        let (sut, httpClientSpy) = makeSut()
        let rickAndMorty = makeRickAndMortyModel()
        expect(sut, completeWith: .success(rickAndMorty), when: {
            httpClientSpy.completeWithData(rickAndMorty.toData()!)
        })
    }
    
    func test_get_should_complete_with_error_if_client_completes_with_invalid_date() {
        let (sut, httpClientSpy) = makeSut()
        expect(sut, completeWith: .failure(.unexpected), when: {
            httpClientSpy.completeWithData(makeInvalidData())
        })
    }
}

extension RemoteRickAndMortyTests {
    
    func makeSut(url: URL = URL(string: "http://default.com")!) -> (sut: RemoteRickAndMorty, httpClientSpy: HttpClientSpy) {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteRickAndMorty(url: url, httpClient: httpClientSpy)
        return (sut, httpClientSpy)
    }
    
    func expect(_ sut: RemoteRickAndMorty, completeWith expectedResult: Result<RickAndMortyModel, DomainError>, when action: () -> Void) {
        let exp = expectation(description: "waiting")
        sut.getRickAndMorty() { receivedResult in
            
            switch (expectedResult, receivedResult) {
            case (.failure(let expectedError), .failure(let receivedError)):
                XCTAssertEqual(expectedError, receivedError)
                
            case (.success(let expectedData), .success(let receviedData)):
                XCTAssertEqual(expectedData, receviedData)
                
            default:
                XCTFail("Expected \(expectedResult) receive \(receivedResult) instead")
            }
            exp.fulfill()
        }
        action()
        wait(for: [exp], timeout: 2)
    }
    
    func makeRickAndMortyModel() -> RickAndMortyModel {
        RickAndMortyModel(characters: "http://characters-url.com")
    }
    
    func makeUrl() -> URL {
        URL(string: "http://something.com")!
    }
    
    func makeInvalidData() -> Data {
        Data("invalid_data".utf8)
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
