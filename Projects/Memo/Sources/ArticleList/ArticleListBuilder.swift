//
//  ArticleListBuilder.swift
//  Memo
//
//  Created by 김지우 on 2022/12/22.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs

protocol ArticleListDependency: Dependency {}

final class ArticleListComponent: Component<ArticleListDependency> {}

// MARK: - Builder

protocol ArticleListBuildable: Buildable {
    func build(withListener listener: ArticleListListener) -> ArticleListRouting
}

final class ArticleListBuilder: Builder<ArticleListDependency>, ArticleListBuildable {

    override init(dependency: ArticleListDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ArticleListListener) -> ArticleListRouting {
        let component = ArticleListComponent(dependency: dependency)
        let viewController = ArticleListViewController()
        let interactor = ArticleListInteractor(presenter: viewController)
        interactor.listener = listener

        return ArticleListRouter(interactor: interactor, viewController: viewController)
    }
}
