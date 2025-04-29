//
//  ItemViewController.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 4/26/25.
//

import UIKit

import SnapKit

final class ItemViewController: UIViewController {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    private let itemList = ItemModel.dummy()
    
    final let carrotLineSpacing: CGFloat = 10
    final let carrotInset = UIEdgeInsets(top: 48, left: 20, bottom: 10, right: 20)
    final let cellHeight: CGFloat = 198
    final let carrotInterItemSpacing: CGFloat = 21
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setCollectionViewLayout()
        setDelegate()
        register()
    }
    
    private func setLayout() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
        }
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func register() {
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
    }
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(itemList.count)
        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        return heightCount * cellHeight + (heightCount - 1) * carrotLineSpacing + carrotInset.top + carrotInset.bottom
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
            
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - carrotInset.left - carrotInset.right - carrotInterItemSpacing
        flowLayout.itemSize = CGSize(width: doubleCellWidth / 2, height: cellHeight)
        flowLayout.minimumLineSpacing = carrotLineSpacing
        flowLayout.minimumInteritemSpacing = carrotInterItemSpacing
        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
}

extension ItemViewController: UICollectionViewDelegate {
    
}

extension ItemViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.dataBind(itemList[indexPath.row])
        return cell
    }
}
