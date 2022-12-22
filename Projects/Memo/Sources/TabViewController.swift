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

final class TabViewController: UIViewController, TabPresentable, TabViewControllable {

    weak var listener: TabPresentableListener?
}
