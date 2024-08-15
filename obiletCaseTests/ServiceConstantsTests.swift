//
//  ServiceConstantsTests.swift
//  obiletCaseTests
//
//  Created by Fazlı Altun on 16.08.2024.
//

import XCTest
@testable import obiletCase

final class ServiceConstantsTests: XCTestCase {
    
    private func testServiceEndpointReturnsCorrectURL() {
        let expectedURL = "https://fakestoreapi.com/products"
        let actualURL = ServiceConstants.serviceEndpoint()
        XCTAssertEqual(expectedURL, actualURL)
    }
}

