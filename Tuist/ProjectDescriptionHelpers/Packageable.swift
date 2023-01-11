import ProjectDescription

// MARK: - Packageable
public protocol Packageable {
    var packageSource: Package { get }
    static var allPackages: [TargetDependency] { get }
    static var allPackageSource: [Package] { get }
}

extension Packageable where Self: CaseIterable, Self: RawRepresentable, Self.RawValue == String {
    public static var allPackages: [TargetDependency] {
        [
            .package(product: RemoteDependencies.rxSwift.packageName),
            .package(product: RemoteDependencies.ribs.packageName),
            .package(product: RemoteDependencies.then.packageName),
            .package(product: RemoteDependencies.snapKit.packageName),
            .package(product: "FirebaseAnalytics"),
            .package(product: "FirebaseMessaging"),
            .package(product: "FirebaseCrashlytics"),
        ]
    }
    public static var allPackageSource: [Package] { allCases.map(\.packageSource) }
}

extension RawRepresentable where Self.RawValue == String {
    public var packageName: String { self.rawValue }
}
