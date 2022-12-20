//
//  CategoryCell.swift
//  Memo
//
//  Created by jaeyoung Yun on 2022/12/20.
//  Copyright © 2022 Memo. All rights reserved.
//

import UIKit

final class CategoryCell: UICollectionViewCell {
    static let reuseIdentifier: String = "CategoryCell"
    private let iconImageView: UIImageView = .init().then {
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .black
    }
    private let nameLabel: UILabel = .init().then {
        $0.textColor = .darkGray
    }
    private let stackView: UIStackView = .init().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.alignment = .center
        $0.spacing = 4
    }
    private let countLabel: UILabel = .init().then {
        $0.text = "0"
        $0.textColor = .darkGray
    }
    private let chevronImageView: UIImageView = .init().then {
        $0.image = .init(systemName: "chevron.right")
        $0.tintColor = .black
        $0.contentMode = .scaleAspectFit
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        layer.cornerRadius = 4
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 4
        backgroundColor = .white
        addSubview(stackView)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(nameLabel)
        addSubview(countLabel)
        addSubview(chevronImageView)
    }

    private func setLayout() {
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        countLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(chevronImageView.snp.leading).offset(-10)
        }
        chevronImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
            make.size.equalTo(16)
        }
    }

    func configure(
        icon: UIImage?,
        categoryName: String,
        count: Int
    ) {
        iconImageView.image = icon
        nameLabel.text = categoryName
        countLabel.text = "\(count)"
    }
}
