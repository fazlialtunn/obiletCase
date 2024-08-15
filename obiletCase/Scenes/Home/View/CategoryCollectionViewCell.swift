//
//  CategoryCollectionViewCell.swift
//  obiletCase
//
//  Created by Fazlı Altun on 14.08.2024.
//

import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.layer.cornerRadius = 5
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with category: String) {
        categoryLabel.text = category
    }
    
    func setSelected(_ isSelected: Bool) {
        if isSelected {
            contentView.backgroundColor = .label
            categoryLabel.textColor = .systemBackground
        } else {
            contentView.backgroundColor = .systemBackground
            categoryLabel.textColor = .label
        }
    }
}
