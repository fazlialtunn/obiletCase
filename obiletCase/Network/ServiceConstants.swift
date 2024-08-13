//
//  ServiceConstants.swift
//  obiletCase
//
//  Created by Fazlı Altun on 13.08.2024.
//

import Foundation

enum ServiceConstants: String {
    case BASE_URL = "https://fakestoreapi.com/products"

    static func serviceEndpoint() -> String {
        "\(BASE_URL.rawValue)"
    }
}
