//
//  Dependencies.swift
//  memo_tuistManifests
//
//  Created by mincheol on 2022/12/14.
//

import ProjectDescription

let dependencies = Dependencies(
     swiftPackageManager: .init(
         [
            .remote(url: "https://github.com/ReactiveX/RxSwift.git", requirement: .upToNextMajor(from: "6.0.0")),
            .remote(url: "https://github.com/RxSwiftCommunity/RxNimble.git", requirement: .upToNextMajor(from: "5.0.0"))
         ]
     ),
     platforms: [.iOS]
 )
