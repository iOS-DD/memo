//
//  WritingRouter.swift
//  Memo
//
//  Created by mincheol on 2022/12/24.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs

protocol WritingInteractable: Interactable {
    var router: WritingRouting? { get set }
    var listener: WritingListener? { get set }
}

protocol WritingViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class WritingRouter: ViewableRouter<WritingInteractable, WritingViewControllable>, WritingRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: WritingInteractable, viewController: WritingViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
