//
//  RootBuilder.swift
//  Memo
//
//  Created by jaeyoung Yun on 2022/12/14.
//

import RIBs

protocol RootDependency: Dependency {}

final class RootComponent: Component<RootDependency> {}

// MARK: - Builder

protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> RIBs.LaunchRouting {
        let viewController = RootViewController()
        _ = RootComponent(dependency: dependency)
        let interactor = RootInteractor(presenter: viewController)

        return RootRouter(
            interactor: interactor,
            viewController: viewController
        )
    }
}
