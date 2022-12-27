//
//  LoginBuilder.swift
//  Memo
//
//  Created by enne on 2022/12/27.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs

protocol LoginDependency: Dependency {}

final class LoginComponent: Component<LoginDependency> {}

// MARK: - Builder

protocol LoginBuildable: Buildable {
    func build(withListener listener: LoginListener) -> ViewableRouting
}

final class LoginBuilder: Builder<LoginDependency>, LoginBuildable {
    func build(withListener listener: LoginListener) -> ViewableRouting {
        let component = LoginComponent(dependency: dependency)
        let viewController = LoginViewController()
        let interactor = LoginInteractor(presenter: viewController)
        interactor.listener = listener
        return LoginRouter(interactor: interactor, viewController: viewController)
    }
}
