//
//  LoginViewController.swift
//  Memo
//
//  Created by enne on 2022/12/27.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

enum LoginAction {
    case login
    case signUp
}

protocol LoginPresentableListener: AnyObject {
    func action(_ action: LoginAction)
}

final class LoginViewController: UIViewController, LoginPresentable, LoginViewControllable {
    weak var listener: LoginPresentableListener?

    // MARK: - Override

    override func loadView() {
        mainView.frame = UIScreen.main.bounds
        mainView.listener = self
        view = mainView
    }

    // MARK: UI

    private let mainView = LoginView()
}

extension LoginViewController: LoginViewListener {
    func tappedLoginButton() {
        listener?.action(.login)
    }

    func tappedSignUpButton() {
        listener?.action(.signUp)
    }
}
