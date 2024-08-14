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
    
    var imageUrl: URL? {
        return URL(string: product?.image ?? "")
    }
}

