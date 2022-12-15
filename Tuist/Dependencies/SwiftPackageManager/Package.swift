// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "PackageName",
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.0.0"),
        .package(url: "https://github.com/RxSwiftCommunity/RxNimble.git", from: "5.0.0"),
        .package(url: "https://github.com/SnapKit/SnapKit", .upToNextMinor(from: "5.0.1")),
        .package(url: "https://github.com/devxoul/Then", from: "3.0.0"),
        .package(url: "https://github.com/uber/RIBs", from: "0.0.0"),
    ]
)