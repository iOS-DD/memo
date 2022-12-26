//
//  CategoryViewController.swift
//  Memo
//
//  Created by jaeyoung Yun on 2022/12/19.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs
import RxSwift
import SnapKit
import Then
import UIKit

struct Category {
    let icon: String
    let name: String
    let count: Int
}

protocol CategoryPresentableListener: AnyObject {}

final class CategoryViewController: UIViewController, CategoryPresentable, CategoryViewControllable {
    weak var listener: CategoryPresentableListener?

    let categories: [Category] = [
        .init(icon: "bus", name: "버스", count: 22123),
        .init(icon: "tram", name: "트램", count: 4),
        .init(icon: "ferry.fill", name: "페리", count: 111),
        .init(icon: "car.fill", name: "차", count: 71),
        .init(icon: "airplane", name: "비행기", count: 0),
    ]

    private let layout: UICollectionViewFlowLayout = .init().then {
        $0.scrollDirection = .vertical
    }

    private let collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: .init()).then {
        let color: CGFloat = 245 / 255
        $0.backgroundColor = .init(red: color, green: color, blue: color, alpha: 1)
        $0.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

    private func setUI() {
        self.tabBarItem = .init(title: nil, image: .init(systemName: "tag"), selectedImage: .init(systemName: "tag.fill"))
        self.navigationItem.title = "분류"
        self.view.backgroundColor = .white
        self.view.addSubview(collectionView)
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true

        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
    }
}

// MARK: - collectionView datasource

extension CategoryViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoryCell.reuseIdentifier,
            for: indexPath
        ) as? CategoryCell
        else {
            return CategoryCell()
        }
        let category = categories[indexPath.row]
        cell.configure(
            icon: .init(systemName: category.icon),
            categoryName: category.name,
            count: category.count
        )

        return cell
    }
}

// MARK: - collectionView delegate

extension CategoryViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return .init(width: collectionView.bounds.width - 40, height: 80)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 20, bottom: 20, right: 20)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
