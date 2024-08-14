//
//  HomeViewModel.swift
//  obiletCase
//
//  Created by Fazlı Altun on 13.08.2024.
//

import Foundation

class HomeViewModel {
    
    var products = [ProductModel]()
    
    func fetchData() {
        APICaller().fetchData { [weak self] result in
            print("result in")
            switch result {
            case .success(let newProducts):
                print("Result: \(newProducts)")
                self?.products = newProducts
                // Notify the view controller about the update
                self?.didUpdateProducts?()
            case .failure(let error):
                print(error.localizedDescription)
                print("failure")
            }
        }
    }
    
    var didUpdateProducts: (() -> Void)?
    
    func numberOfSection(_ section: Int) -> Int {
        return products.count
    }
}

