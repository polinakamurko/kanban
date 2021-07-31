//
//  ItemsCollectionView.swift
//  KanbanBoard
//
//  Created by Полина Истомина on 27.07.2021.
//

import UIKit

extension ItemsCollectionView {
    struct Constants {
        static let defaultTextHeight: CGFloat = 22
    }
}

final class ItemsCollectionView: UICollectionView {
    
    private var items = [Item]()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with items: [Item]) {
        self.items = items
        reloadData()
    }
}

// MARK: - Private
private extension ItemsCollectionView {
    func setup() {
        delegate = self
        dataSource = self
        register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.cellId)
    }
}

// MARK: - UICollectionViewDataSource
extension ItemsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.cellId,
                                                      for: indexPath) as! ItemCollectionViewCell
        cell.configureItem(with: items[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ItemsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = items[indexPath.item]
        return estimateCellSize(item)
    }
    
    private func estimateCellSize(_ item: Item) -> CGSize {
        let textWidth = frame.width - 24
        let textHeight = item.title.height(withConstrainedWidth: textWidth,
                                           font: UIFont.preferredFont(forTextStyle: .body))
        let cellHeight = textHeight + 24
        return CGSize(width: frame.width, height: cellHeight)
    }
}
