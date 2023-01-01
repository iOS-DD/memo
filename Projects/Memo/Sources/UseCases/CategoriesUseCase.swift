//
//  CategoriesUseCase.swift
//  Memo
//
//  Created by jaeyoung Yun on 2023/01/01.
//  Copyright © 2023 Memo. All rights reserved.
//

import Foundation
import RxSwift

protocol CategoriesUseCase {
    func execute() -> Observable<[Category]>
}

final class DefaultCategoriesUseCase: CategoriesUseCase {
    private let categoryRepository: CategoryRepository

    init(categoryRepository: CategoryRepository) {
        self.categoryRepository = categoryRepository
    }

    func execute() -> Observable<[Category]> {
        return categoryRepository.categories
    }
}
