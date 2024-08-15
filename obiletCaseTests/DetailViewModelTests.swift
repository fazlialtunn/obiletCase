//
//  DetailViewModelTests.swift
//  DetailViewModelTests
//
//  Created by Fazlı Altun on 15.08.2024.
//

import XCTest
@testable import obiletCase

final class DetailViewModelTests: XCTestCase {
    
    private var viewModel: DetailViewModel!
    private var product: ProductModel!
    
    override func setUp() {
        super.setUp()
        // Create a mock product for testing
        product = ProductModel(
            id: 1,
            title: "Sample Product",
            price: 99.99,
            description: "This is a sample product description.",
            category: Category.electronics,
            image: "https://example.com/image.jpg",
            rating: Rating( rate: 4.5, count: 120)
        )
        viewModel = DetailViewModel( product: product)
    }
    
    override func tearDown() {
        viewModel = nil
        product = nil
        super.tearDown()
    }
    
    private func testTitle() {
        XCTAssertEqual(viewModel.title, "Sample Product")
    }
    
    private func testDescription() {
        XCTAssertEqual(viewModel.description, "This is a sample product description.")
    }
    
    private func testPrice() {
        XCTAssertEqual(viewModel.price,  99.99)
    }
    
    private func testRating() {
        XCTAssertEqual(viewModel.rating, 4.5)
    }
    
    private func testReviewerCount() {
        XCTAssertEqual( viewModel.reviewerCount, 120)
    }
    
    private func testImageUrl() {
        XCTAssertEqual(viewModel.imageUrl, URL(string: "https://example.com/image.jpg"))
    }
}
