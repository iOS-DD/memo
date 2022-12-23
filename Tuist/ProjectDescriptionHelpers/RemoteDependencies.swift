import ProjectDescription

public enum RemoteDependencies: String, CaseIterable, Packageable {
    case rxSwift = "RxSwift"
    case ribs = "RIBs"
    case then = "Then"
    case snapKit = "SnapKit"
    case firebase = "Firebase"

    public var packageSource: Package {
        switch self {
        case .rxSwift:
            return .remote(url: "\(self.github)/ReactiveX/\(self.rawValue).git", requirement: .upToNextMinor(from: "6.5.0"))
        case .ribs:
            return .remote(url: "\(self.github)/uber/\(self.rawValue).git", requirement: .branch("main"))
        case .then:
            return .remote(url: "\(self.github)/devxoul/\(self.rawValue)", requirement: .upToNextMinor(from: "3.0.0"))
        case .snapKit:
            return .remote(url: "\(self.github)/SnapKit/\(self.rawValue).git", requirement: .upToNextMinor(from: "5.0.1"))
        case .firebase:
            return .remote(url: "\(self.github)/firebase/firebase-ios-sdk.git", requirement: .upToNextMinor(from: "10.0.0"))
        }
    }
}

extension RemoteDependencies {
    var github: String { "https://github.com" }
}
