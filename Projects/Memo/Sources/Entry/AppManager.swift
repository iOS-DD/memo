//
//  AppManager.swift
//  Memo
//
//  Created by enne on 2022/12/23.
//  Copyright © 2022 Memo. All rights reserved.
//

import FirebaseCore
import Foundation

final class AppManager {
    static let shared: AppManager = .init()

    private init() {}
    
    func start() {
        FirebaseApp.configure()
    }
}
