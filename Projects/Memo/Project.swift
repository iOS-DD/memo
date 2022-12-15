//
//  Project.swift
//  memo_tuistManifests
//
//  Created by mincheol on 2022/12/14.
//

import ProjectDescription
import ProjectDescriptionHelpers

private let projectName = "memo"
private let iOSTargetVersion = "14.2"

let infoPlistPath: String = "Supported Files/Info.plist"

let project = Project.app(name: projectName,
                          platform: .iOS,
                          iOSTargetVersion: iOSTargetVersion,
                          infoPlist: infoPlistPath,
                          dependencies: [
                            .external(name: "RIBs"),
                            .external(name: "RxSwift"),
                            .external(name: "SnapKit"),
                            .external(name: "Then")
                          ])




