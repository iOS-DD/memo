//
//  ArticleListCell.swift
//  Memo
//
//  Created by 김지우 on 2022/12/22.
//  Copyright © 2022 Memo. All rights reserved.
//

import UIKit

import SnapKit
import Then

final class ArticleListCell: UITableViewCell {
    static let reuseIdentifier: String = "ArticleListCell"

    private let containerView = UIView().then {
        $0.backgroundColor = .white

        $0.layer.borderColor = UIColor.gray.withAlphaComponent(0.08).cgColor
        $0.layer.borderWidth = 1

        $0.layer.cornerRadius = 4
    }

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

    override func prepareForReuse() {
        super.prepareForReuse()

        articleContentLabel.text = nil
        sourceLabel.text = nil
        pageLabel.text = nil
        writerLabel.text = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        renderShadow()
    }

    private func setViewAttributes() {
        backgroundColor = .clear
        selectionStyle = .none
    }

    private func render() {
        contentView.addSubview(containerView)

        containerView.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(48)
            $0.top.bottom.equalToSuperview().inset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
        }

        containerView.addSubview(articleContentLabel)
        containerView.addSubview(sourceStackView)
        containerView.addSubview(additionalInformationStackView)
        sourceStackView.addArrangedSubview(sourceLabel)
        sourceStackView.addArrangedSubview(pageLabel)
        additionalInformationStackView.addArrangedSubview(sourceStackView)
        additionalInformationStackView.addArrangedSubview(writerLabel)

        articleContentLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(16)
        }

        additionalInformationStackView.snp.makeConstraints {
            $0.top.equalTo(articleContentLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.lessThanOrEqualToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(8)
        }
    }

    private func renderShadow() {
        guard
            containerView.bounds.width != 0.0,
            containerView.layer.shadowColor != UIColor.gray.cgColor
        else {
             return
        }

        containerView.layer.shadowColor = UIColor.gray.withAlphaComponent(0.1).cgColor
        containerView.layer.shadowPath = UIBezierPath(rect: containerView.bounds).cgPath
        containerView.layer.shadowRadius = 4
    }

    func configure(data: Article) {
        articleContentLabel.text = data.content
        sourceLabel.text = data.source
        pageLabel.text = "p.\(data.page)"
        writerLabel.text = data.writer
    }
}
