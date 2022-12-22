//
//  ArticleListInteractor.swift
//  Memo
//
//  Created by 김지우 on 2022/12/22.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs
import RxSwift

protocol ArticleListRouting: ViewableRouting {}

protocol ArticleListPresentable: Presentable {
    var listener: ArticleListPresentableListener? { get set }
}

protocol ArticleListListener: AnyObject {}

final class ArticleListInteractor: PresentableInteractor<ArticleListPresentable>, ArticleListInteractable, ArticleListPresentableListener {

    weak var router: ArticleListRouting?
    weak var listener: ArticleListListener?

    override init(presenter: ArticleListPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}
