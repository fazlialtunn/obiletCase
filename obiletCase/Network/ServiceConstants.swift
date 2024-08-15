//
//  ServiceConstants.swift
//  obiletCase
//
//  Created by Fazlı Altun on 13.08.2024.
//

import Foundation

/// An enum that defines the constants used for the service URLs.
enum ServiceConstants: String {
    
    case BASE_URL = "https://fakestoreapi.com/products"
    
    /// Provides the service endpoint URL for fetching product data.
    /// - Returns: A string representing the full URL for the product API.
    static func serviceEndpoint() -> String {
        return "\(BASE_URL.rawValue)"
    }
}

