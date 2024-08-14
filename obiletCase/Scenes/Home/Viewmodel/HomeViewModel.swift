//
//  HomeViewModel.swift
//  obiletCase
//
//  Created by Fazlı Altun on 13.08.2024.
//

import Foundation

final class HomeViewModel {
    
    private var allProducts = [ProductModel]()
    var products = [ProductModel]()
    var filteredProducts = [ProductModel]()
    let categories = ["electronics", "jewelery", "men's clothing", "women's clothing"]
    var selectedCategory: String?
    
    func fetchData() {
        APICaller().fetchData { [weak self] result in
            switch result {
            case .success(let newProducts):
                self?.allProducts = newProducts
                self?.products = newProducts
                self?.filteredProducts = newProducts
                self?.didUpdateProducts?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func filterProducts(by searchText: String) {
        if searchText.isEmpty {
            products = allProducts
        } else {
            products = allProducts.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
        didUpdateProducts?()
    }
    
    func filterProducts(with category: String) {
        if category.isEmpty {
            filteredProducts = products
        } else {
            filteredProducts = products.filter { $0.category.rawValue == category }
        }
        didUpdateProducts?()
    }
    
    
    var didUpdateProducts: (() -> Void)?
    
    func numberOfSection(_ section: Int) -> Int {
        return filteredProducts.count
    }
    
    func product(at index: Int) -> ProductModel {
        return filteredProducts[index]
    }
    
    func clearFilter() {
        selectedCategory = nil
        filteredProducts = products
        didUpdateProducts?()
    }
}

