//
//  ItemCollectionViewCell.swift
//  KanbanBoard
//
//  Created by Полина Истомина on 27.07.2021.
//

import UIKit

final class ItemCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "Item"
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureItem(with item: Item) {
        titleLabel.text = item.title
    }
}

// MARK: - Private
private extension ItemCollectionViewCell {
    func setupAppearance() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.white.cgColor,
                                UIColor(red: 0.949, green: 0.949, blue: 0.969, alpha: 1).cgColor]
        layer.insertSublayer(gradientLayer, at: 0)
        layer.masksToBounds = true
        layer.cornerRadius = 10.0
    }
    
    func addSubviews() {
        addSubview(titleLabel)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
}
