//
//  AppDelegate.swift
//  Memo
//
//  Created by enne on 2022/12/09.
//

import RIBs
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var launchRouter: LaunchRouting?

    private var appManager = AppManager.shared

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        let launchRouter = RootBuilder(
            dependency: AppComponent(
                categoriesUseCase: DefaultCategoriesUseCase(categoryRepository: DefaultCategoryRepository())
            )
        ).build()
        self.launchRouter = launchRouter
        launchRouter.launch(from: window)
        // appManager.start()
        return true
    }
}
