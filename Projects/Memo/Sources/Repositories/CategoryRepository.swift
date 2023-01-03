//
//  CategoryRepository.swift
//  Memo
//
//  Created by jaeyoung Yun on 2023/01/01.
//  Copyright © 2023 Memo. All rights reserved.
//

import Foundation
import RxSwift

protocol CategoryRepository {
    var categories: Observable<[Category]> { get }
}

final class DefaultCategoryRepository: CategoryRepository {
    // TODO: - 카테고리 개수를 체크하기 위해 저장해서 사용하기
    private let _categories: [Category] = [
        .init(icon: "book.closed", name: "독서", count: 22123),
        .init(icon: "music.note.list", name: "음악", count: 4),
        .init(icon: "note.text", name: "일상", count: 111),
        .init(icon: "fork.knife", name: "음식", count: 71),
        .init(icon: "airplane", name: "여행", count: 0),
    ]

    var categoriesSubject: BehaviorSubject<[Category]>
    var categories: Observable<[Category]> { categoriesSubject }

    init() {
        categoriesSubject = .init(value: _categories)
    }
}
