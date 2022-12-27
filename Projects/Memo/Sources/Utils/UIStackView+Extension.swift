//
//  UIStackView+Extension.swift
//  Memo
//
//  Created by enne on 2022/12/28.
//  Copyright © 2022 Memo. All rights reserved.
//

import UIKit

public extension UIStackView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}
