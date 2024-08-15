//
//  HomeViewModelTests.swift
//  obiletCaseTests
//
//  Created by Fazlı Altun on 15.08.2024.
//

import XCTest
@testable import obiletCase

final class HomeViewModelTests: XCTestCase {

    private var viewModel: HomeViewModel!
    private var mockAPICaller: MockAPICaller!

    override func setUp() {
        super.setUp()
        
        // Initialize the view model and mock API caller
        mockAPICaller = MockAPICaller()
        viewModel = HomeViewModel()
        viewModel.fetchData()
    }

    override func tearDown() {
        viewModel = nil
        mockAPICaller = nil
        super.tearDown()
    }

    func testFetchData() {
        
        mockAPICaller.mockProducts = [
            ProductModel(id: 1, title: "Sample Product", price: 99.99, description: "Description", category: .electronics, image: "", rating: Rating(rate: 4.5, count: 120))
        ]
        
        viewModel.didUpdateProducts = {
            XCTAssertEqual(self.viewModel.filteredProducts.count, 20)
            XCTAssertEqual(self.viewModel.filteredProducts.first?.title, "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops")
        }
        
        viewModel.fetchData()
    }

    func testFilterBySearchText() {
        // Simulate data fetching
        let expectation = self.expectation(description: "Filter by Search Text")
        
        mockAPICaller.mockProducts = [
            ProductModel(id: 1, title: "Sample Product", price: 99.99, description: "Description", category: .electronics, image: "", rating: Rating(rate: 4.5, count: 120)),
            ProductModel(id: 2, title: "Another Product", price: 29.99, description: "Description", category: .jewelery, image: "", rating: Rating(rate: 3.5, count: 80))
        ]
        
        viewModel.didUpdateProducts = {
            XCTAssertEqual(self.viewModel.filteredProducts.count, 0)
            XCTAssertEqual(self.viewModel.filteredProducts.first?.title, nil)
            expectation.fulfill()
        }
        
        viewModel.fetchData()
        viewModel.filterProducts(by: "Sample")
        waitForExpectations(timeout: 1, handler: nil)
    }

    func testFilterByCategory() {
        // Simulate data fetching
        let expectation = self.expectation(description: "Filter by Category")
        
        mockAPICaller.mockProducts = [
            ProductModel(id: 1, title: "Sample Product", price: 99.99, description: "Description", category: .electronics, image: "", rating: Rating(rate: 4.5, count: 120)),
            ProductModel(id: 2, title: "Another Product", price: 29.99, description: "Description", category: .jewelery, image: "", rating: Rating(rate: 3.5, count: 80))
        ]
        
        viewModel.didUpdateProducts = {
            XCTAssertEqual(self.viewModel.filteredProducts.count, 0)
            XCTAssertEqual(self.viewModel.filteredProducts.first?.category, nil)
            expectation.fulfill()
        }
        
        viewModel.fetchData()
        viewModel.filterProducts(with: "electronics")
        waitForExpectations(timeout: 1, handler: nil)
    }
}

// Mock for APICaller
class MockAPICaller: APICaller {
    var mockProducts: [ProductModel] = []
    
    override func fetchData(completion: @escaping (Result<[ProductModel], Error>) -> Void) {
        completion(.success(mockProducts))
    }
}
