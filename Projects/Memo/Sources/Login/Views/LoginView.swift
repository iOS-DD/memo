//
//  LoginView.swift
//  Memo
//
//  Created by enne on 2022/12/27.
//  Copyright © 2022 Memo. All rights reserved.
//

import UIKit

protocol LoginViewListener: AnyObject {
    func tappedSignUpButton()
    func tappedLoginButton()
}

final class LoginView: UIView {
    weak var listener: LoginViewListener?
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)

        setupUI()
        defineLayouts()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(#function)
    }
    
    // MARK: - UI

    private let verticalStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 5
    }

    private let signUpButton = UIButton(type: .custom).then {
        let attributedString = NSAttributedString(
            string: "가입",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        )
        $0.setAttributedTitle(attributedString, for: .normal)
        $0.cornerRadius(25)
        $0.border(
            width: 0.5,
            color: .black.withAlphaComponent(0.3)
        )
    }

    private let loginButton = UIButton(type: .custom).then {
        let attributedString = NSAttributedString(
            string: "로그인",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        )
        $0.setAttributedTitle(attributedString, for: .normal)
        $0.cornerRadius(25)
        $0.border(
            width: 0.5,
            color: .black.withAlphaComponent(0.3)
        )
    }

    private func setupUI() {
        addSubview(verticalStackView)
        backgroundColor = .white
        verticalStackView.addSubviews(signUpButton, loginButton)
        signUpButton.addTarget(self, action: #selector(tappedSignUpButton), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
    }

    private func defineLayouts() {
        verticalStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }

        signUpButton.snp.makeConstraints {
            $0.height.equalTo(50)
        }

        loginButton.snp.makeConstraints {
            $0.height.equalTo(50)
        }
    }
}

// MARK: - Private

private extension LoginView {
    @objc func tappedSignUpButton(_ button: UIButton) {
        listener?.tappedSignUpButton()
    }

    @objc func tappedLoginButton(_ button: UIButton) {
        listener?.tappedLoginButton()
    }
}
