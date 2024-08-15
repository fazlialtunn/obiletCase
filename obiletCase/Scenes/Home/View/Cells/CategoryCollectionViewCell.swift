//
//  CategoryCollectionViewCell.swift
//  obiletCase
//
//  Created by Fazlı Altun on 14.08.2024.
//

import UIKit

/// Custom collection view cell used for displaying category filters in a horizontal collection view.
final class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    
    // Label to display the category name, centered and with a medium font weight.
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    // Initializer for the cell, setting up the label and cell appearance.
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(categoryLabel)
        
        // Use SnapKit to set constraints for the label to fill the cell's content view.
        categoryLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // Configure the appearance of the cell's content view.
        contentView.layer.cornerRadius = 5
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    // Required initializer for loading the cell from storyboard or nib, not implemented.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Configures the cell with a category name.
    func configure(with category: String) {
        categoryLabel.text = category
    }
    
    // Updates the cell's appearance based on whether it is selected.
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
