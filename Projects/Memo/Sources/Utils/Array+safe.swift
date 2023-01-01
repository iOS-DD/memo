//
//  Array+safe.swift
//  Memo
//
//  Created by jaeyoung Yun on 2023/01/01.
//  Copyright © 2023 Memo. All rights reserved.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        guard indices ~= index else {
            return nil
        }

        return self[index]
    }
}
