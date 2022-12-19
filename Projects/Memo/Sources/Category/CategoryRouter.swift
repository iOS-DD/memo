//
//  CategoryRouter.swift
//  Memo
//
//  Created by jaeyoung Yun on 2022/12/19.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs

protocol CategoryInteractable: Interactable {
    var router: CategoryRouting? { get set }
    var listener: CategoryListener? { get set }
}

protocol CategoryViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class CategoryRouter: ViewableRouter<CategoryInteractable, CategoryViewControllable>, CategoryRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: CategoryInteractable, viewController: CategoryViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
