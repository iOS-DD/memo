//
//  ArticleListViewController.swift
//  Memo
//
//  Created by 김지우 on 2022/12/22.
//  Copyright © 2022 Memo. All rights reserved.
//

import UIKit

import RIBs
import RxSwift
import SnapKit
import Then

struct Article {
    let content: String
    let source: String
    let page: Int
    let writer: String
}

protocol ArticleListPresentableListener: AnyObject {}

final class ArticleListViewController: UIViewController, ArticleListPresentable, ArticleListViewControllable {
    private let navigationView = UIView().then {
        let color: CGFloat = 245 / 255
        $0.backgroundColor = .init(red: color, green: color, blue: color, alpha: 1)
    }

    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.text = "내가 담은 글"
        $0.textAlignment = .left
    }

    private let articleCountLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .darkGray
        $0.textAlignment = .right
    }

    private let tableView = UITableView(frame: .zero, style: .grouped).then {
        let color: CGFloat = 245 / 255
        $0.backgroundColor = .init(red: color, green: color, blue: color, alpha: 1)
        $0.contentInset = UIEdgeInsets(top: -32, left: 0, bottom: 0, right: 0)
        $0.register(ArticleListCell.self, forCellReuseIdentifier: ArticleListCell.reuseIdentifier)
        $0.separatorStyle = .none
    }

    private let articles: [Article] = [
        .init(content: "첫번째 담은 글 내용", source: "첫번째", page: 1, writer: "홍길동"),
        .init(content: "두두번째 담은 글 내용", source: "두번째", page: 1, writer: "임꺽정"),
        .init(content: "세세세번째 담은 글 내용", source: "세번째", page: 1, writer: "장영실"),
        .init(content: "네네네네번째 담은 글 내용", source: "네번째", page: 1, writer: "이순신"),
        .init(
            content: "다섯다섯다섯다섯다섯번째 담은 글 내용\n다섯다섯다섯다섯다섯번째 담은 글 내용\n다섯다섯다섯다섯다섯번째 담은 글 내용\n",
            source: "다섯번째",
            page: 1,
            writer: "이방원"
        )
    ]

    weak var listener: ArticleListPresentableListener?

    override func viewDidLoad() {
        super.viewDidLoad()

        setAttributes()
        render()
    }

    private func setAttributes() {
        tableView.dataSource = self

        articleCountLabel.text = "\(articles.count)편의 글을 담음"
    }

    private func render() {
        let color: CGFloat = 245 / 255
        view.backgroundColor = .init(red: color, green: color, blue: color, alpha: 1)

        view.addSubview(navigationView)
        view.addSubview(tableView)
        navigationView.addSubview(titleLabel)
        navigationView.addSubview(articleCountLabel)

        navigationView.snp.makeConstraints {
            $0.height.equalTo(48)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        articleCountLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension ArticleListViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return articles.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ArticleListCell.reuseIdentifier,
                for: indexPath
            ) as? ArticleListCell
        else {
            return ArticleListCell()
        }

        cell.configure(data: articles[indexPath.item])
        return cell
    }
}
