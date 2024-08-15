//
//  DetailViewModel.swift
//  obiletCase
//
//  Created by Fazlı Altun on 13.08.2024.
//

import Foundation

/// `DetailViewModel` is responsible for providing data to the `DetailViewController`.
final class DetailViewModel {
    private let product: ProductModel?
    
    init(product: ProductModel) {
        self.product = product
    }
    
    /// Provides the product's details including title, description, price, rating, reviewer count, and image URL.
    var title: String {
        return product?.title ?? "Title"
    }
    
    var description: String {
        return product?.description ?? "Description"
    }
    
    var price: Double {
        return product?.price ?? 0
    }
    
    var rating: Double {
        return product?.rating.rate ?? 0
    }
    
    var reviewerCount: Int {
        return product?.rating.count ?? 0
    }
    
    var imageUrl: URL? {
        return URL(string: product?.image ?? "")
    }
}
