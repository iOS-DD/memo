//
//  ArticleListViewController.swift
//  Memo
//
//  Created by 김지우 on 2022/12/22.
//  Copyright © 2022 Memo. All rights reserved.
//

import UIKit

import RIBs
import RxSwift
import SnapKit
import Then


protocol ArticleListPresentableListener: AnyObject {}

final class ArticleListViewController: UIViewController, ArticleListPresentable, ArticleListViewControllable {
    weak var listener: ArticleListPresentableListener?
}
