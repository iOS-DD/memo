//
//  TabInteractor.swift
//  Memo
//
//  Created by jaeyoung Yun on 2022/12/22.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs
import RxSwift

protocol TabRouting: ViewableRouting {
}

protocol TabPresentable: Presentable {
    var listener: TabPresentableListener? { get set }
}

protocol TabListener: AnyObject {}

final class TabInteractor: PresentableInteractor<TabPresentable>, TabInteractable, TabPresentableListener {

    weak var router: TabRouting?
    weak var listener: TabListener?

    override init(presenter: TabPresentable) {
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
