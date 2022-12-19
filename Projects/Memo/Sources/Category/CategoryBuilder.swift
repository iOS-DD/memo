//
//  CategoryBuilder.swift
//  Memo
//
//  Created by jaeyoung Yun on 2022/12/19.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs

protocol CategoryDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class CategoryComponent: Component<CategoryDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol CategoryBuildable: Buildable {
    func build(withListener listener: CategoryListener) -> CategoryRouting
}

final class CategoryBuilder: Builder<CategoryDependency>, CategoryBuildable {

    override init(dependency: CategoryDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: CategoryListener) -> CategoryRouting {
        let component = CategoryComponent(dependency: dependency)
        let viewController = CategoryViewController()
        let interactor = CategoryInteractor(presenter: viewController)
        interactor.listener = listener
        return CategoryRouter(interactor: interactor, viewController: viewController)
    }
}
