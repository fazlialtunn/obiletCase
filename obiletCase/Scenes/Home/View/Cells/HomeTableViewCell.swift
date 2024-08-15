//
//  HomeTableViewCell.swift
//  obiletCase
//
//  Created by Fazlı Altun on 14.08.2024.
//

import UIKit
import SnapKit
import SDWebImage

/// Custom table view cell for displaying product details in a list.
class HomeTableViewCell: UITableViewCell {
    static let identifier = "HomeTableViewCell"
    
    // Lazy-loaded image view to display the product's image.
    lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 2)
        imageView.layer.shadowOpacity = 0.2
        imageView.layer.shadowRadius = 4
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Lazy-loaded label to display the product's title.
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Lazy-loaded label to display the product's price.
    lazy var productPrice: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textColor = .label
        priceLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        priceLabel.numberOfLines = 0
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceLabel
    }()
    
    // Lazy-loaded label to display the product's rating.
    lazy var productRating: UILabel = {
        let ratingLabel = UILabel()
        ratingLabel.textColor = .label
        ratingLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        ratingLabel.numberOfLines = 0
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        return ratingLabel
    }()
    
    // Initializer for the cell, setting up subviews and their constraints.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(productImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(productPrice)
        contentView.addSubview(productRating)
        
        // Setting up constraints for productImage.
        productImage.snp.makeConstraints { make in
            make.height.width.equalTo(130)
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        // Setting up constraints for titleLabel.
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.left.equalTo(productImage.snp.right).offset(10)
            make.right.equalToSuperview().offset(-8)
        }
        
        // Setting up constraints for productPrice.
        productPrice.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalTo(productImage.snp.right).offset(10)
            make.right.equalToSuperview().offset(-8)
            make.bottom.lessThanOrEqualToSuperview().offset(-10)
        }
        
        // Setting up constraints for productRating.
        productRating.snp.makeConstraints { make in
            make.top.equalTo(productPrice.snp.bottom).offset(5)
            make.left.equalTo(productImage.snp.right).offset(10)
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-50)
        }
    }
    
    // Required initializer for loading the cell from storyboard or nib, not implemented.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Configures the cell with a product model.
    func configure(with product: ProductModel) {
        titleLabel.text = product.title
        productPrice.text = "Price 💵: " + String(describing: product.price) + "$"
        productRating.text = "Rating: " + String(describing: product.rating.rate) + "⭐️" + (" (\(product.rating.count)") + "👤)"
        if let imageUrl = URL(string: product.image) {
            // Using SDWebImage to load the product image from URL.
            productImage.sd_setImage(with: imageUrl, completed: nil)
        }
    }
}
