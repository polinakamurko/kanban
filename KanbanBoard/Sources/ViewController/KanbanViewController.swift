//
//  ViewController.swift
//  KanbanBoard
//
//  Created by Полина Истомина on 26.07.2021.
//

import UIKit

extension KanbanViewController {
    struct Constants {
        static let topCollectionViewInset: CGFloat = 12
        static let mediumPadding: CGFloat = 32
        static let smallPadding: CGFloat = 16
    }
}

final class KanbanViewController: UIViewController {
    
    private let boards = [
        Board(title: "First Board", items: Item.generateMockItems()),
        Board(title: "Second Board", items: Item.generateMockItems()),
        Board(title: "Third Board", items: Item.generateMockItems())
    ]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .systemPink
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCollectionView()
        setupLayout()
        setupCollectionView()
    }
    
    func addCollectionView() {
        view.addSubview(collectionView)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - Private
private extension KanbanViewController {
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: Constants.topCollectionViewInset,
                                                   left: 0, bottom: 0, right: 0)
        collectionView.register(BoardCollectionViewCell.self,
                                forCellWithReuseIdentifier: BoardCollectionViewCell.cellId)
        collectionView.isPagingEnabled = true
        
    }
}

// MARK: - UICollectionViewDataSource
extension KanbanViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return boards.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BoardCollectionViewCell.cellId,
            for: indexPath
        ) as! BoardCollectionViewCell
        cell.configure(board: boards[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension KanbanViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        var height = collectionView.frame.height
        height -= view.safeAreaInsets.top
        height -= view.safeAreaInsets.bottom
        height -= Constants.mediumPadding
        return CGSize(width: collectionView.frame.width - Constants.mediumPadding, height: height)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return Constants.mediumPadding
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(top: Constants.topCollectionViewInset,
                            left: Constants.smallPadding,
                            bottom: 0,
                            right: Constants.smallPadding)
    }
    
}
