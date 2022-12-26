//
//  RootRouter.swift
//  Memo
//
//  Created by jaeyoung Yun on 2022/12/14.
//

import RIBs

protocol RootInteractable: Interactable,
                           TabListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    private let tabBuilder: TabBuildable
    private var tabRouter: TabRouting?

    init(
        interactor: RootInteractable,
        viewController: RootViewControllable,
        tabBuilder: TabBuildable
    ) {
        self.tabBuilder = tabBuilder

        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    override func didLoad() {
        super.didLoad()

        routeToTab()
    }

    private func routeToTab() {
        let tabRouter = tabBuilder.build(withListener: interactor)
        self.tabRouter = tabRouter
        attachChild(tabRouter)

        tabRouter.viewControllable.setViewControllers([])

        viewController.present(tabRouter.viewControllable, animated: true, completion: nil)
    }
}
