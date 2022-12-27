//
//  LoginInteractor.swift
//  Memo
//
//  Created by enne on 2022/12/27.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs
import RxSwift

protocol LoginRouting: ViewableRouting {}

protocol LoginPresentable: Presentable {
    var listener: LoginPresentableListener? { get set }
}

protocol LoginListener: AnyObject {}

final class LoginInteractor: PresentableInteractor<LoginPresentable>, LoginInteractable, LoginPresentableListener {

    weak var router: LoginRouting?
    weak var listener: LoginListener?

    override init(presenter: LoginPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
    
    func action(_ action: LoginAction) {
        switch action {
        case .signUp:
            break
        case .login:
            break
        }
    }
}
