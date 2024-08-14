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
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(productImage)
        contentView.addSubview(titleLabel)
        
        productImage.snp.makeConstraints { make in
            make.height.equalTo(130)
            make.top.equalTo(10)
            make.left.equalTo(8)
            make.right.equalTo(-8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(productImage.snp.bottom).offset(5)
            make.left.equalTo(8)
            make.right.equalTo(-8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with product: ProductModel) {
        titleLabel.text = product.title
        if let imageUrl = URL(string: product.image) {
            // Assuming you're using a library like SDWebImage to load images
            productImage.sd_setImage(with: imageUrl, completed: nil)
        }
    }
}

