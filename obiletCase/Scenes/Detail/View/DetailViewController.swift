//
//  DetailViewController.swift
//  obiletCase
//
//  Created by Fazlı Altun on 13.08.2024.
//

import UIKit
import SnapKit
import SDWebImage

// ViewController to display detailed information about a selected product
final class DetailViewController: UIViewController {
    
    // ViewModel that provides data for this view controller
    var viewModel: DetailViewModel?
    
    // UI components
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .systemGreen
        label.backgroundColor = .systemGray6
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.text = "Price: $0.00"
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOpacity = 0.1
        label.layer.shadowOffset = CGSize(width: 0, height: 2)
        label.layer.shadowRadius = 4
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .systemOrange
        label.layer.borderColor = UIColor.systemOrange.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.text = "Rating: 0 ⭐️"
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOpacity = 0.1
        label.layer.shadowOffset = CGSize(width: 0, height: 2)
        label.layer.shadowRadius = 4
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()
    
    private let addToCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add to Cart", for: .normal)
        button.backgroundColor = .label
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.setTitleColor(.systemBackground, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 8
        button.addTarget(self, action: #selector(addToCartTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        configureWithViewModel()
    }
    
    // Set up UI elements with constraints
    private func setupViews() {
        view.addSubview(productImageView)
        view.addSubview(titleLabel)
        view.addSubview(priceLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(ratingLabel)
        view.addSubview(addToCartButton)
        
        // Layout constraints for productImageView
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.centerX.equalTo(view)
            make.height.equalTo(250)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
        // Layout constraints for titleLabel
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        // Layout constraints for priceLabel
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.width.lessThanOrEqualToSuperview().multipliedBy(0.35)
            make.height.equalTo(40)
        }
        
        // Layout constraints for ratingLabel
        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalTo(priceLabel.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(priceLabel)
        }
        
        // Layout constraints for descriptionLabel
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(16)
            make.leading.equalTo(titleLabel)
            make.trailing.equalTo(titleLabel)
        }
        
        // Layout constraints for addToCartButton
        addToCartButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.leading.equalTo(titleLabel)
            make.trailing.equalTo(titleLabel)
            make.height.equalTo(55)
        }
    }
    
    // Configure the view with data from the viewModel
    private func configureWithViewModel() {
        guard let viewModel = viewModel else { return }
        
        titleLabel.text = viewModel.title
        priceLabel.text = "Price: \(viewModel.price)$"
        descriptionLabel.text = viewModel.description
        ratingLabel.text = "Rating: \(viewModel.rating) ⭐️ (\(viewModel.reviewerCount)👤)"
        
        // Load image asynchronously
        if let imageURL = viewModel.imageUrl {
            productImageView.sd_setImage(with: imageURL, completed: nil)
        }
    }
    
    // Handle Add to Cart button tap
    @objc private func addToCartTapped() {
        showSuccessPopup()
    }
    
    // Show a popup to indicate success
    private func showSuccessPopup() {
        let popupView = UIView()
        popupView.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.9)
        popupView.layer.cornerRadius = 12
        popupView.layer.shadowColor = UIColor.black.cgColor
        popupView.layer.shadowOpacity = 0.3
        popupView.layer.shadowOffset = CGSize(width: 0, height: 4)
        popupView.layer.shadowRadius = 8
        popupView.translatesAutoresizingMaskIntoConstraints = false
        
        let checkmarkImageView = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
        checkmarkImageView.tintColor = .white
        checkmarkImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let messageLabel = UILabel()
        messageLabel.text = "Successfully added to cart."
        messageLabel.numberOfLines = 0
        messageLabel.textColor = .white
        messageLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        popupView.addSubview(checkmarkImageView)
        popupView.addSubview(messageLabel)
        view.addSubview(popupView)
        
        // Layout constraints for popupView
        NSLayoutConstraint.activate([
            popupView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            popupView.widthAnchor.constraint(equalToConstant: 300),
            popupView.heightAnchor.constraint(equalToConstant: 120),
            
            // Layout constraints for checkmarkImageView
            checkmarkImageView.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 16),
            checkmarkImageView.centerYAnchor.constraint(equalTo: popupView.centerYAnchor),
            checkmarkImageView.widthAnchor.constraint(equalToConstant: 40),
            checkmarkImageView.heightAnchor.constraint(equalToConstant: 40),
            
            // Layout constraints for messageLabel
            messageLabel.leadingAnchor.constraint(equalTo: checkmarkImageView.trailingAnchor, constant: 8),
            messageLabel.centerYAnchor.constraint(equalTo: popupView.centerYAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -16)
        ])
        
        // Show popup with animation
        popupView.alpha = 0
        UIView.animate(withDuration: 0.3, animations: {
            popupView.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.3, delay: 1.5, options: [], animations: {
                popupView.alpha = 0
            }) { _ in
                popupView.removeFromSuperview()
            }
        }
    }
}
