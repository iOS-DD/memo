//
//  AppComponent.swift
//  Memo
//
//  Created by jaeyoung Yun on 2022/12/18.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {

    init() {
      super.init(dependency: EmptyComponent())
    }
}
