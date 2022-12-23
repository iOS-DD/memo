//
//  RootTests.swift
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
import XCTest

final class RootInteactorTests: XCTestCase {
    var interactor: RootInteractor!
    var listener: RootListenerMock!
    var presenter: RootPresentableMock!
    var viewController: RootViewControllableMock!
    var router: RootRoutingMock!

    override func setUp() {
        super.setUp()

        viewController = RootViewControllableMock()
        listener = RootListenerMock()
        presenter = RootPresentableMock()
        interactor = RootInteractor(
            presenter: presenter
        )
        interactor.listener = listener

        router = RootRoutingMock(
            interactable: interactor,
            viewControllable: viewController
        )
        interactor.router = router

        router.load()
        router.interactable.activate()
    }
    
    // TODO: - 현정: 테스트 빌드가 제대로 셋팅되었는지 확인하기 위한 테스트. 제거 예정
    func testRootInteractor_생성() {
        XCTAssertTrue(interactor.isActive)
    }
}

