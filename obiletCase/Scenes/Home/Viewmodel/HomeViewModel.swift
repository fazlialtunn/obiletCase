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
    var searchText: String = ""
    
    func fetchData() {
        APICaller().fetchData { [weak self] result in
            switch result {
            case .success(let newProducts):
                self?.allProducts = newProducts
                self?.applyFilters()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func applyFilters() {
        var filtered = allProducts
        
        if let category = selectedCategory {
            filtered = filtered.filter { $0.category.rawValue == category }
        }
        
        if !searchText.isEmpty {
            filtered = filtered.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
        
        filteredProducts = filtered
        didUpdateProducts?()
    }
    
    func filterProducts(by searchText: String) {
        self.searchText = searchText
        applyFilters()
    }
    
    func filterProducts(with category: String) {
        selectedCategory = category.isEmpty ? nil : category
        applyFilters()
    }
    
    func clearFilter() {
        selectedCategory = nil
        searchText = ""
        filteredProducts = allProducts
        didUpdateProducts?()
    }
    
    var didUpdateProducts: (() -> Void)?
    
    func numberOfSection(_ section: Int) -> Int {
        return filteredProducts.count
    }
    
    func product(at index: Int) -> ProductModel {
        return filteredProducts[index]
    }
}
