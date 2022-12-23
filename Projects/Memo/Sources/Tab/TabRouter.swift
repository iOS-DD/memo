//
//  TabRouter.swift
//  Memo
//
//  Created by jaeyoung Yun on 2022/12/22.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs

protocol TabInteractable: Interactable,
                          CategoryListener {
    var router: TabRouting? { get set }
    var listener: TabListener? { get set }
}

protocol TabViewControllable: ViewControllable {

    func setViewControllers(_ viewControllers: [ViewControllable])
}

final class TabRouter: ViewableRouter<TabInteractable, TabViewControllable>, TabRouting {

    private let categoryBuilder: CategoryBuildable
    private var categoryRouter: CategoryRouting?

    init(
        interactor: TabInteractable,
        viewController: TabViewControllable,
        categoryBuilder: CategoryBuildable
    ) {
        self.categoryBuilder = categoryBuilder

        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    override func didLoad() {
        super.didLoad()

        attachTabs()
    }

    func attachTabs() {
        let categoryRouter = categoryBuilder.build(withListener: interactor)

        attachChild(categoryRouter)
        self.categoryRouter = categoryRouter

        viewController.setViewControllers([
            NavigationControllerable(root: categoryRouter.viewControllable),
        ])
    }
}
