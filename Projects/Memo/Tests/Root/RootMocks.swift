//
//  RootMocks.swift
//  Memo
//
//  Created by enne on 2022/12/23.
//  Copyright © 2022 Memo. All rights reserved.
//

@testable import Memo

import Foundation
import RIBs
import RxSwift
import UIKit

// MARK: - RootRoutingMock

final class RootRoutingMock: RootRouting {
    var viewControllable: ViewControllable

    var interactableCallCount = 0
    var interactable: Interactable {
        didSet {
            interactableCallCount += 1
        }
    }

    var childrenCallCount = 0
    var children: [Routing] = .init() {
        didSet {
            childrenCallCount += 1
        }
    }

    var lifecycleSubjectCallCount = 0
    var lifecycleSubject: PublishSubject<RouterLifecycle> = .init() {
        didSet {
            lifecycleSubjectCallCount += 1
        }
    }

    var lifecycle: Observable<RouterLifecycle> {
        lifecycleSubject
    }

    var loadHandler: (() -> ())?
    var loadCallCount: Int = 0

    var attachChildHandler: ((_ child: Routing) -> ())?
    var attachChildCallCount: Int = 0

    var detachChildHandler: ((_ child: Routing) -> ())?
    var detachChildCallCount: Int = 0

    init(interactable: Interactable, viewControllable: ViewControllable) {
        self.interactable = interactable
        self.viewControllable = viewControllable
    }

    func load() {
        loadCallCount += 1
        loadHandler?()
    }

    func attachChild(_ child: Routing) {
        attachChildCallCount += 1
        attachChildHandler?(child)
    }

    func detachChild(_ child: Routing) {
        detachChildCallCount += 1
        detachChildHandler?(child)
    }
}

// MARK: - RootListnerMock

final class RootListenerMock: RootListener {

}

// MARK: - RootPresentableMock

final class RootPresentableMock: RootPresentable {
    var listenerCallCount = 0
    var listener: RootPresentableListener? {
        didSet {
            listenerCallCount += 1
        }
    }
}

// MARK: - RootViewControllableMock

final class RootViewControllableMock: RootViewControllable {
    var viewControllerCallCount = 0
    var uiviewController: UIViewController = .init() {
        didSet {
            viewControllerCallCount += 1
        }
    }
}
