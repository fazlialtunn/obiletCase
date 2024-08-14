//
//  HomeTableViewCell.swift
//  obiletCase
//
//  Created by Fazlı Altun on 14.08.2024.
//

import UIKit
import SnapKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {
    static let identifier = "HomeTableViewCell"
    
    lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var productPrice: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textColor = .label
        priceLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        priceLabel.numberOfLines = 0
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceLabel
    }()
    
    lazy var productRating: UILabel = {
        let ratingLabel = UILabel()
        ratingLabel.textColor = .label
        ratingLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        ratingLabel.numberOfLines = 0
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        return ratingLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(productImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(productPrice)
        contentView.addSubview(productRating)
        
        productImage.snp.makeConstraints { make in
            make.height.width.equalTo(130)
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(productImage.snp.right).offset(10)
            make.right.equalToSuperview().offset(-8)
        }
        
        productPrice.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalTo(productImage.snp.right).offset(10)
            make.right.equalToSuperview().offset(-8)
            make.bottom.lessThanOrEqualToSuperview().offset(-10)
        }
        
        productRating.snp.makeConstraints { make in
            make.top.equalTo(productPrice.snp.bottom).offset(5)
            make.left.equalTo(productImage.snp.right).offset(10)
            make.right.equalToSuperview().offset(-8)
            make.bottom.lessThanOrEqualToSuperview().offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with product: ProductModel) {
        titleLabel.text = product.title
        productPrice.text = String(describing: product.price) + "$"
        productRating.text = String(describing: product.rating.rate) + "⭐️" + (" (\(product.rating.count)") + "👤)"
        if let imageUrl = URL(string: product.image) {
            // Assuming you're using a library like SDWebImage to load images
            productImage.sd_setImage(with: imageUrl, completed: nil)
        }
    }
}

