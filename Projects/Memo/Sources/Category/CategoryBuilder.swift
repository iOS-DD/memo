//
//  CategoryBuilder.swift
//  Memo
//
//  Created by jaeyoung Yun on 2022/12/19.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs

protocol CategoryDependency: Dependency {
    var categoriesUseCase: CategoriesUseCase { get }
}

final class CategoryComponent: Component<CategoryDependency> {
    var categoriesUseCase: CategoriesUseCase { dependency.categoriesUseCase }
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
        let interactor = CategoryInteractor(
            presenter: viewController,
            categoriesUseCase: component.categoriesUseCase
        )
        interactor.listener = listener
        return CategoryRouter(interactor: interactor, viewController: viewController)
    }
}
