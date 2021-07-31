//
//  BoardCollectionViewCell.swift
//  KanbanBoard
//
//  Created by Полина Истомина on 27.07.2021.
//

import UIKit

final class BoardCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "Cell"
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.textColor = .black
        return label
    }()
    
    private let itemsCollectionView: ItemsCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = ItemsCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    private let addItemButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Добавить элемент", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        return button
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
    
    func configure(board: Board) {
        titleLabel.text = board.title
        itemsCollectionView.configure(with: board.items)
    }
}

// MARK: - Settings
private extension BoardCollectionViewCell {
    func setupAppearance() {
        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.light))
        blurEffectView.frame = bounds
        backgroundView = blurEffectView
        
        layer.masksToBounds = true
        layer.cornerRadius = 10.0
    }
    
    func addSubviews() {
        addSubview(itemsCollectionView)
        addSubview(addItemButton)
        addSubview(titleLabel)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 34),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            itemsCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            itemsCollectionView.bottomAnchor.constraint(equalTo: addItemButton.topAnchor, constant: -16),
            itemsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            itemsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            addItemButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            addItemButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            addItemButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            addItemButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
