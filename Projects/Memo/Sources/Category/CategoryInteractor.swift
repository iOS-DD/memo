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

final class CategoryInteractor: PresentableInteractor<CategoryPresentable>, CategoryInteractable {

    weak var router: CategoryRouting?
    weak var listener: CategoryListener?
    private let categoriesUseCase: CategoriesUseCase

    private let categoriesSubject: BehaviorSubject<[Category]>

    init(
        presenter: CategoryPresentable,
        categoriesUseCase: CategoriesUseCase
    ) {
        self.categoriesUseCase = categoriesUseCase
        categoriesSubject = .init(value: [])

        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()

        bindCategories()
    }

    override func willResignActive() {
        super.willResignActive()
    }

    func bindCategories() {
        categoriesUseCase.execute()
            .subscribe(onNext: {
                self.categoriesSubject.onNext($0)
            })
            .disposeOnDeactivate(interactor: self)
    }
}

extension CategoryInteractor: CategoryPresentableListener {
    var categories: Observable<[Category]> { categoriesSubject }

    func didTapCell(_ category: Category) {
        // TODO: - 카테고리 셀 탭 이후 동작
    }
}
