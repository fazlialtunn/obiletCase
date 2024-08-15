//
//  DetailViewModel.swift
//  obiletCase
//
//  Created by Fazlı Altun on 13.08.2024.
//

import Foundation

/// `DetailViewModel` is responsible for providing data to the `DetailViewController`.
final class DetailViewModel {
    
    // The product model containing the details to be displayed
    private let product: ProductModel?
    
    // Initialize with a ProductModel object
    init(product: ProductModel) {
        self.product = product
    }
    
    /// The title of the product. Returns a default value if the product is nil.
    var title: String {
        return product?.title ?? "Title"
    }
    
    /// The description of the product. Returns a default value if the product is nil.
    var description: String {
        return product?.description ?? "Description"
    }
    
    /// The price of the product. Returns 0 if the product is nil.
    var price: Double {
        return product?.price ?? 0
    }
    
    /// The rating of the product. Returns 0 if the product is nil.
    var rating: Double {
        return product?.rating.rate ?? 0
    }
    
    /// The number of reviewers for the product. Returns 0 if the product is nil.
    var reviewerCount: Int {
        return product?.rating.count ?? 0
    }
    
    /// The image URL of the product. Returns nil if the product is nil or if the URL is invalid.
    var imageUrl: URL? {
        return URL(string: product?.image ?? "")
    }
}
