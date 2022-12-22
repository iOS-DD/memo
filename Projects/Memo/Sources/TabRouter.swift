//
//  TabRouter.swift
//  Memo
//
//  Created by jaeyoung Yun on 2022/12/22.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs

protocol TabInteractable: Interactable {
    var router: TabRouting? { get set }
    var listener: TabListener? { get set }
}

protocol TabViewControllable: ViewControllable {}

final class TabRouter: ViewableRouter<TabInteractable, TabViewControllable>, TabRouting {

    override init(interactor: TabInteractable, viewController: TabViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
