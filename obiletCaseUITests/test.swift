//
//  test.swift
//  obiletCaseUITests
//
//  Created by Fazlı Altun on 15.08.2024.
//

import XCTest
@testable import obiletCase

class DetailViewModelTestTests: XCTestCase {

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
            rating: Rating(rate: 4.5, count: 120)
        )
        viewModel = DetailViewModel(product: product)
    }

    override func tearDown() {
        viewModel = nil
        product = nil
        super.tearDown()
    }

    func testTitle() {
        XCTAssertEqual(viewModel.title, "Sample Product", "Title should match the product title.")
    }

    func testDescription() {
        XCTAssertEqual(viewModel.description, "This is a sample product description.", "Description should match the product description.")
    }

    func testPrice() {
        XCTAssertEqual(viewModel.price, 99.99, "Price should match the product price.")
    }

    func testRating() {
        XCTAssertEqual(viewModel.rating, 4.5, "Rating should match the product rating.")
    }

    func testReviewerCount() {
        XCTAssertEqual(viewModel.reviewerCount, 120, "Reviewer count should match the product reviewer count.")
    }

    func testImageUrl() {
        XCTAssertEqual(viewModel.imageUrl, URL(string: "https://example.com/image.jpg"), "Image URL should match the product image URL.")
    }
}

