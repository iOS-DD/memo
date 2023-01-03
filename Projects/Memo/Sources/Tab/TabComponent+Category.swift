//
//  TabComponent+Category.swift
//  Memo
//
//  Created by jaeyoung Yun on 2022/12/23.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs

extension TabComponent: CategoryDependency {
    var categoriesUseCase: CategoriesUseCase {
        dependency.categoriesUseCase
    }
}
