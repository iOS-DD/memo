//
//  TabBuilder.swift
//  Memo
//
//  Created by jaeyoung Yun on 2022/12/22.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs

protocol TabDependency: Dependency {}

final class TabComponent: Component<TabDependency> {}

// MARK: - Builder

protocol TabBuildable: Buildable {
    func build(withListener listener: TabListener) -> TabRouting
}

final class TabBuilder: Builder<TabDependency>, TabBuildable {

    override init(dependency: TabDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: TabListener) -> TabRouting {
        let component = TabComponent(dependency: dependency)
        let viewController = TabViewController()
        let interactor = TabInteractor(presenter: viewController)
        interactor.listener = listener
        return TabRouter(interactor: interactor, viewController: viewController)
    }
}
