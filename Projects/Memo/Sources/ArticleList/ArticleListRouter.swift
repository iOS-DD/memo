//
//  ArticleListRouter.swift
//  Memo
//
//  Created by 김지우 on 2022/12/22.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs

protocol ArticleListInteractable: Interactable {
    var router: ArticleListRouting? { get set }
    var listener: ArticleListListener? { get set }
}

protocol ArticleListViewControllable: ViewControllable {}

final class ArticleListRouter: ViewableRouter<ArticleListInteractable, ArticleListViewControllable>, ArticleListRouting {

    override init(
        interactor: ArticleListInteractable,
        viewController: ArticleListViewControllable
    ) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
