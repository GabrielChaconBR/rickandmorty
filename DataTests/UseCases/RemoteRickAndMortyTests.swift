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
    
    func test_get_should_not_complete_if_sut_has_been_deallocated() {
        let httpClientSpy = HttpClientSpy()
        var sut: RemoteRickAndMorty? = RemoteRickAndMorty(url: makeUrl(), httpClient: httpClientSpy)
        var result: Result<RickAndMortyModel, DomainError>?
        sut?.getRickAndMorty(completion: { result = $0
            
        })
        sut = nil
        httpClientSpy.completeWithError(.noConnectivity)
        XCTAssertNil(result)
    }
}

extension RemoteRickAndMortyTests {
    
    func makeSut(url: URL = URL(string: "http://default.com")!,
                 file: StaticString = #file, line: UInt = #line) -> (sut: RemoteRickAndMorty, httpClientSpy: HttpClientSpy) {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteRickAndMorty(url: url, httpClient: httpClientSpy)
        checkMemoryLeak(for: sut, file: file, line: line)
        checkMemoryLeak(for: httpClientSpy, file: file, line: line)
        return (sut, httpClientSpy)
    }
    
    func expect(_ sut: RemoteRickAndMorty, completeWith expectedResult: Result<RickAndMortyModel, DomainError>, when action: () -> Void,
                file: StaticString = #file, line: UInt = #line) {
        let exp = expectation(description: "waiting")
        sut.getRickAndMorty() { receivedResult in
            
            switch (expectedResult, receivedResult) {
            case (.failure(let expectedError), .failure(let receivedError)):
                XCTAssertEqual(expectedError, receivedError, file: file, line: line)
                
            case (.success(let expectedData), .success(let receviedData)):
                XCTAssertEqual(expectedData, receviedData, file: file, line: line)
                
            default:
                XCTFail("Expected \(expectedResult) receive \(receivedResult) instead", file: file, line: line)
            }
            exp.fulfill()
        }
        action()
        wait(for: [exp], timeout: 2)
    }
    
    func checkMemoryLeak(for instance: AnyObject,
                         file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, file: file, line: line)
        }
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
