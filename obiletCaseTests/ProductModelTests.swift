//
//  ProductModelTests.swift
//  obiletCaseTests
//
//  Created by Fazlı Altun on 16.08.2024.
//

import XCTest
@testable import obiletCase

final class ProductModelTests: XCTestCase {
    
    // Sample JSON data
    private let jsonData = """
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
    """.data(using: .utf8)!
    
    func testProductModelDecoding() {
        let decoder = JSONDecoder()
        do {
            let product = try decoder.decode(ProductModel.self, from: jsonData)
            XCTAssertEqual(product.id, 1)
            XCTAssertEqual(product.title, "Sample Product")
            XCTAssertEqual(product.price, 99.99)
            XCTAssertEqual(product.description, "This is a sample product description.")
            XCTAssertEqual(product.category, .electronics)
            XCTAssertEqual(product.image, "https://example.com/image.jpg")
            XCTAssertEqual(product.rating.rate, 4.5)
            XCTAssertEqual(product.rating.count, 120)
        } catch {
            XCTFail("Decoding failed: \(error)")
        }
    }
}
