//
//  ViewController.swift
//  obiletCase
//
//  Created by Fazlı Altun on 13.08.2024.
//

import UIKit

final class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .label
        APICaller().fetchData { result in
            print("result in")
            switch result {
            case .success(let products):
                print("Result: \(products)")
            case .failure(let error):
                print(error.localizedDescription)
                print("failure")
            }
        }
    }
}

