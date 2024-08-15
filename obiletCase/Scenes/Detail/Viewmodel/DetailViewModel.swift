//
//  DetailViewModel.swift
//  obiletCase
//
//  Created by Fazlı Altun on 13.08.2024.
//

import Foundation

final class DetailViewModel {
    let product: ProductModel?
    
    init(product: ProductModel) {
        self.product = product
    }
    
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
    
    var imageUrl: URL? {
        return URL(string: product?.image ?? "")
    }
}

