//
//  APICaller.swift
//  obiletCase
//
//  Created by Fazlı Altun on 13.08.2024.
//

import Foundation

class APICaller {
    func fetchData(completion: @escaping((Result<([ProductModel]), Error>) -> ())) {
        let url = URL(string: ServiceConstants.serviceEndpoint())
        print("URL: \(url)")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                print("error")
                completion(.failure(error))
            }
            
            if let data = data {
                print("data")
                let result = try? JSONDecoder().decode([ProductModel].self, from: data)
                
                if let result = result {
                    print("complete success")
                    completion(.success(result.self))
                }
            }
        }.resume()
    }
}
