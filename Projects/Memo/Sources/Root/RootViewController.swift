//
//  RootViewController.swift
//  Memo
//
//  Created by jaeyoung Yun on 2022/12/14.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: AnyObject {}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
}
