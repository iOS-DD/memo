//
//  CategoryViewController.swift
//  Memo
//
//  Created by jaeyoung Yun on 2022/12/19.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol CategoryPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class CategoryViewController: UIViewController, CategoryPresentable, CategoryViewControllable {

    weak var listener: CategoryPresentableListener?
}
