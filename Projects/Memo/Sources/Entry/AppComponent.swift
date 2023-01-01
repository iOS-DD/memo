//
//  AppComponent.swift
//  Memo
//
//  Created by jaeyoung Yun on 2022/12/18.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
    var categoriesUseCase: CategoriesUseCase

    init(categoriesUseCase: CategoriesUseCase) {
        self.categoriesUseCase = categoriesUseCase
        super.init(dependency: EmptyComponent())
    }
}
