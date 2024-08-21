//
//  HomeViewModel.swift
//  obiletCase
//
//  Created by Fazlı Altun on 13.08.2024.
//

import Foundation

/// ViewModel for managing the home screen's product data, including fetching, filtering, and providing data to the view.
final class HomeViewModel {
    
    // Array to hold all products fetched from the API.
    private var allProducts = [ProductModel]()
    
    // Array to hold the current list of products being displayed.
    var products = [ProductModel]()
    
    // Array to hold products filtered based on category and search text.
    var filteredProducts = [ProductModel]()
    
    // Array of categories available for filtering.
    let categories = ["electronics", "jewelery", "men's clothing", "women's clothing"]
    
    // The currently selected category for filtering.
    var selectedCategory: String?
    
    // The current search text for filtering products by title.
    var searchText: String = ""
    
    /// Fetches product data from the API and applies any existing filters.
    func fetchData() {
        APICaller().fetchData { [weak self] result in
            switch result {
            case .success(let newProducts):
                // Update the product arrays with the new data.
                self?.allProducts = newProducts
                self?.applyFilters()
            case .failure(let error):
                // Print error message if the fetch fails.
                print(error.localizedDescription)
            }
        }
    }
    
    /// Applies filters to the products based on the selected category and search text.
    func applyFilters() {
        var filtered = allProducts
        
        // Filter by category if a category is selected.
        if let category = selectedCategory {
            filtered = filtered.filter { $0.category.rawValue == category }
        }
        
        // Filter by search text if it is not empty.
        if !searchText.isEmpty {
            filtered = filtered.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
        
        // Update the filtered products and notify about the update.
        filteredProducts = filtered
        didUpdateProducts?()
    }
    
    /// Updates the search text and applies filters based on it.
    func filterProducts(by searchText: String) {
        self.searchText = searchText
        applyFilters()
    }
    
    /// Updates the selected category and applies filters based on it.
    func filterProducts(with category: String) {
        selectedCategory = category.isEmpty ? nil : category
        applyFilters()
    }
    
    /// Clears all filters and resets the filtered products to the complete list.
    func clearFilter() {
        selectedCategory = nil
        searchText = ""
        filteredProducts = allProducts
        didUpdateProducts?()
    }
    
    /// Closure that is called when the products are updated and ready to be displayed.
    var didUpdateProducts: (VoidCallback)?
    
    /// Returns the number of products in the filtered list.
    func numberOfSection(_ section: Int) -> Int {
        return filteredProducts.count
    }
    
    /// Returns the product at a specific index in the filtered list.
    func product(at index: Int) -> ProductModel {
        return filteredProducts[index]
    }
}
