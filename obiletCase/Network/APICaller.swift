//
//  APICaller.swift
//  obiletCase
//
//  Created by Fazlı Altun on 13.08.2024.
//

import Foundation

/// A class responsible for making network requests to fetch product data.
class APICaller {
    private var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    /// Fetches product data from the API.
    /// - Parameter completion: A closure that gets called with the result of the network request.
    ///   It returns either an array of ProductModel on success or an Error on failure.
    func fetchData(completion: @escaping (Result<[ProductModel], Error>) -> Void) {
        guard let url = URL(string: ServiceConstants.serviceEndpoint()) else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(.failure(error))
            return
        }
        
        print("URL: \(url)")
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(error))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([ProductModel].self, from: data)
                completion(.success(products))
            } catch let decodingError {
                print("Decoding error: \(decodingError.localizedDescription)")
                completion(.failure(decodingError))
            }
        }
        
        task.resume()
    }

}
