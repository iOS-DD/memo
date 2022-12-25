//
//  WritingViewController.swift
//  Memo
//
//  Created by mincheol on 2022/12/24.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol WritingPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class WritingViewController: UIViewController, WritingPresentable, WritingViewControllable {

    weak var listener: WritingPresentableListener?
}
