//
//  CategoryInteractor.swift
//  Memo
//
//  Created by jaeyoung Yun on 2022/12/19.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs
import RxSwift

protocol CategoryRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol CategoryPresentable: Presentable {
    var listener: CategoryPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol CategoryListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class CategoryInteractor: PresentableInteractor<CategoryPresentable>, CategoryInteractable, CategoryPresentableListener {

    weak var router: CategoryRouting?
    weak var listener: CategoryListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: CategoryPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
