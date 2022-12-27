//
//  UIView+Extension.swift
//  Memo
//
//  Created by enne on 2022/12/27.
//  Copyright © 2022 Memo. All rights reserved.
//

import UIKit

public extension UIView {
    func cornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.cornerCurve = .continuous
        layer.masksToBounds = true
    }
    
    func border(
        width: CGFloat,
        color: UIColor
    ) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}
