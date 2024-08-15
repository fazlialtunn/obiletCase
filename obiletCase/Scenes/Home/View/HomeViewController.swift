//
//  ViewController.swift
//  obiletCase
//
//  Created by Fazlı Altun on 13.08.2024.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private var viewModel = HomeViewModel()
    private var selectedCategoryIndexPath: IndexPath?
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search Products"
        searchBar.delegate = self
        return searchBar
    }()
    
    lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        return collectionView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Home Page"
        navigationController?.navigationBar.tintColor = .label
        setupNavigationBar()
        configureSearchBar()
        configureCategoryCollectionView()
        configureTableView()
        bindViewModel()
        fetchData()
    }
    
    private func setupNavigationBar() {
        let titleView = UIView()
        
        let titleLabel = UILabel()
        titleLabel.text = "Home Page"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = .label
        
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(systemName: "house.fill") // Use your desired icon here
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .label
        
        titleView.addSubview(iconImageView)
        titleView.addSubview(titleLabel)
        
        // Layout the icon and the label
        iconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24) // Adjust size as needed
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        navigationItem.titleView = titleView
        titleView.sizeToFit()
    }
    
    private func configureSearchBar() {
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    private func configureCategoryCollectionView() {
        view.addSubview(categoryCollectionView)
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().offset(5)
            make.height.equalTo(50)
        }
    }
    
    private func configureTableView(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(5)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func fetchData() {
        viewModel.fetchData()
    }
    
    private func bindViewModel() {
        viewModel.didUpdateProducts = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterProducts(by: searchText)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        let category = viewModel.categories[indexPath.item]
        cell.configure(with: category)
        
        // Update cell appearance based on selection
        if category == viewModel.selectedCategory {
            cell.setSelected(true)
        } else {
            cell.setSelected(false)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCategory = viewModel.categories[indexPath.item]
        
        if selectedCategory == viewModel.selectedCategory {
            // Deselect and show all products
            viewModel.clearFilter()
        } else {
            // Select and filter products
            viewModel.filterProducts(with: selectedCategory)
        }
        
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 40)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        let product = viewModel.product(at: indexPath.row)
        cell.configure(with: product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension HomeViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = viewModel.product(at: indexPath.row)
        let detailViewController = DetailViewController()
        detailViewController.viewModel = DetailViewModel(product: product)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
