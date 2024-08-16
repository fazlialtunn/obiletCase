//
//  APICallerTests.swift
//  obiletCaseTests
//
//  Created by Fazlı Altun on 16.08.2024.
//

import XCTest
@testable import obiletCase

class APICallerTests: XCTestCase {
    
    var apiCaller: APICaller!
    var mockSession: URLSession!
    
    override func setUp() {
        super.setUp()
        // Initialize mock session
        mockSession = URLSession(configuration: .ephemeral)
        apiCaller = APICaller(session: mockSession)
    }
    
    // Test for successful fetch
    func testFetchDataSuccess() {
        // Create a mock URL and response
        let mockURL = URL(string: "https://example.com")!
        let mockData = """
        [
            {
                "id": 1,
                "title": "Sample Product",
                "price": 99.99,
                "description": "This is a sample product description.",
                "category": "electronics",
                "image": "https://example.com/image.jpg",
                "rating": {
                    "rate": 4.5,
                    "count": 120
                }
            }
        ]
        """.data(using: .utf8)!
        
        let mockTask = MockURLSessionDataTask()
        let mockSession = MockURLSession(data: mockData, response: nil, error: nil, task: mockTask)
        
        let apiCaller = APICaller(session: mockSession)
        
        let expectation = XCTestExpectation(description: "Fetch data")
        
        apiCaller.fetchData { result in
            switch result {
            case .success(let products):
                XCTAssertEqual(products.count, 1)
                XCTAssertEqual(products.first?.title, "Sample Product")
            case .failure(let error):
                XCTFail("Expected success but got error: \(error)")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // Test for fetch failure
    func testFetchDataFailure() {
        let mockError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Test error"])
        let mockTask = MockURLSessionDataTask()
        let mockSession = MockURLSession(data: nil, response: nil, error: mockError, task: mockTask)
        
        let apiCaller = APICaller(session: mockSession)
        
        let expectation = XCTestExpectation(description: "Fetch data")
        
        apiCaller.fetchData { result in
            switch result {
            case .success(_):
                XCTFail("Expected failure but got success")
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "Test error")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // Mock URLSession and data task
    private class MockURLSession: URLSession {
        private let mockData: Data?
        private let mockResponse: URLResponse?
        private let mockError: Error?
        private let mockTask: URLSessionDataTask
        
        init(data: Data?, response: URLResponse?, error: Error?, task: URLSessionDataTask) {
            self.mockData = data
            self.mockResponse = response
            self.mockError = error
            self.mockTask = task
        }
        
        override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            completionHandler(mockData, mockResponse, mockError)
            return mockTask
        }
    }
    
    private class MockURLSessionDataTask: URLSessionDataTask {
        override func resume() {
        }
    }
}
