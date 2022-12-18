//
//  Project.swift
//  memo_tuistManifests
//
//  Created by mincheol on 2022/12/14.
//

import ProjectDescription
import ProjectDescriptionHelpers

let appTarget = Target(
    name: "Memo",
    platform: .iOS,
    product: .app,
    productName: "Memo",
    bundleId: "com.dd.Memo",
    deploymentTarget: .iOS(
        targetVersion: "14.2",
        devices: .iphone
    ),
    infoPlist: .file(path: "Supported Files/Info.plist"),
    sources: "Sources/**",
    resources: "Resources/**",
    dependencies: [RemoteDependencies.allPackages].flatMap { $0 }
)

let testTarget = Target(
    name: "MemoTests",
    platform: .iOS,
    product: .unitTests,
    productName: "MemoTests",
    bundleId: "com.dd.MemoTests",
    deploymentTarget: .iOS(
        targetVersion: "14.2",
        devices: .iphone
    ),
    infoPlist: .file(path: "Supported Files/MemoTests-Info.plist"),
    sources: "Tests/**",
    dependencies: [
        [
          .xctest,
          .target(name: "Memo"),
          .package(product: "RxTest"),
        ]
    ].flatMap { $0 }
)

let project = Project(
    name: "Memo",
    organizationName: "Memo",
    options: .options(
        automaticSchemesOptions: .disabled,
        disableBundleAccessors: true,
        disableSynthesizedResourceAccessors: true,
        textSettings: .textSettings(
            usesTabs: false,
            indentWidth: 4,
            tabWidth: 4,
            wrapsLines: true
        )
    ),
    packages: [
        RemoteDependencies.allPackageSource
    ].flatMap { $0 },
    targets: [
        appTarget,
        testTarget
    ],
    schemes: [
        Scheme(
            name: "Memo-Dev",
            shared: true,
            buildAction: .buildAction(
                targets: ["Memo"]
            ),
            testAction: .targets(
                ["MemoTests"],
                options: .options(coverage: true)
            ),
            runAction: .runAction(configuration: .debug)
        ),
        Scheme(
            name: "Memo-Release",
            shared: true,
            buildAction: .buildAction(
                targets: ["Memo"]
            ),
            testAction: .targets(["MemoTests"]),
            runAction: .runAction(configuration: .release)
        )
    ]
)





