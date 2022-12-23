//
//  CategoryInteractor.swift
//  Memo
//
//  Created by jaeyoung Yun on 2022/12/19.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs
import RxSwift

protocol CategoryRouting: ViewableRouting {}

protocol CategoryPresentable: Presentable {
    var listener: CategoryPresentableListener? { get set }
}

protocol CategoryListener: AnyObject {}

final class CategoryInteractor: PresentableInteractor<CategoryPresentable>, CategoryInteractable, CategoryPresentableListener {

    weak var router: CategoryRouting?
    weak var listener: CategoryListener?

    override init(presenter: CategoryPresentable) {
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
