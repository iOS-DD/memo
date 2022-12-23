//
//  ArticleListCell.swift
//  Memo
//
//  Created by 김지우 on 2022/12/22.
//  Copyright © 2022 Memo. All rights reserved.
//

import UIKit

final class ArticleListCell: UITableViewCell {
    static let reuseIdentifier: String = "ArticleListCell"

    private let articleContentLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.textColor = .darkGray
    }

    private let sourceStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.spacing = 4
    }

    private let additionalInformationStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.spacing = 4
    }

    private let sourceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .lightGray
    }

    private let pageLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .lightGray
    }

    private let writerLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .lightGray
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setViewAttributes()
        render()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setViewAttributes() {
        backgroundColor = .white

        layer.cornerRadius = 4
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 4

        selectionStyle = .none
    }

    private func render() {
        addSubview(articleContentLabel)
        addSubview(sourceStackView)
        addSubview(additionalInformationStackView)
        sourceStackView.addArrangedSubview(sourceLabel)
        sourceStackView.addArrangedSubview(pageLabel)
        additionalInformationStackView.addArrangedSubview(sourceStackView)
        additionalInformationStackView.addArrangedSubview(writerLabel)

        articleContentLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(16)
        }

        additionalInformationStackView.snp.makeConstraints {
            $0.top.equalTo(articleContentLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(8)
        }
    }

    func configure(data: Article) {
        articleContentLabel.text = data.content
        sourceLabel.text = data.source
        pageLabel.text = "\(data.page)"
        writerLabel.text = data.writer
    }
}
