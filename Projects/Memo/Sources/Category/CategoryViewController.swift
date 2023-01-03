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
    var count: Int
}

protocol CategoryPresentableListener: AnyObject {
    var categories: Observable<[Category]> { get }

    func didTapCell(_ category: Category)
}

final class CategoryViewController: UIViewController, CategoryPresentable, CategoryViewControllable {
    weak var listener: CategoryPresentableListener?
    private let disposeBag: DisposeBag = .init()

    private var categories: [Category] = []

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
        bind()
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

    private func bind() {
        listener?.categories
            .subscribe(on: MainScheduler.instance)
            .withUnretained(self)
            .subscribe(onNext: { owner, categories in
                owner.categories = categories
                owner.collectionView.reloadData()
            })
            .disposed(by: disposeBag)
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let category = categories[safe: indexPath.row] else {
            return
        }

        listener?.didTapCell(category)
    }
}
