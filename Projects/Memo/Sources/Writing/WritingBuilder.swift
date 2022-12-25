//
//  WritingBuilder.swift
//  Memo
//
//  Created by mincheol on 2022/12/24.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs

protocol WritingDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class WritingComponent: Component<WritingDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol WritingBuildable: Buildable {
    func build(withListener listener: WritingListener) -> WritingRouting
}

final class WritingBuilder: Builder<WritingDependency>, WritingBuildable {

    override init(dependency: WritingDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: WritingListener) -> WritingRouting {
        let component = WritingComponent(dependency: dependency)
        let viewController = WritingViewController()
        let interactor = WritingInteractor(presenter: viewController)
        interactor.listener = listener
        return WritingRouter(interactor: interactor, viewController: viewController)
    }
}
