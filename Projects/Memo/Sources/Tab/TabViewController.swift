//
//  TabViewController.swift
//  Memo
//
//  Created by jaeyoung Yun on 2022/12/22.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol TabPresentableListener: AnyObject {}

final class TabViewController: UITabBarController, TabPresentable {

    weak var listener: TabPresentableListener?

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

    private func setUI() {
        self.modalPresentationStyle = .fullScreen
        self.tabBar.tintColor = .black
        self.tabBar.backgroundColor = .white
    }
}

extension TabViewController: TabViewControllable {

    func setViewControllers(_ viewControllers: [ViewControllable]) {
        setViewControllers(viewControllers.map(\.uiviewController), animated: false)
    }
}
