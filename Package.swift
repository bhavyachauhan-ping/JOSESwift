// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "JOSESwift",
    platforms: [.iOS(.v10), .macOS(.v10_15), .watchOS(.v4)],
    products: [
        .library(name: "JOSESwift", targets: ["JOSESwift"])
    ],
    dependencies: [.package(url: "https://github.com/GigaBitcoin/secp256k1.swift.git", from: "0.10.0")],
    targets: [
        .target(name: "JOSESwift",
                dependencies: [.product(name: "secp256k1", package: "secp256k1.swift")],
                path: "JOSESwift")
    ],
    swiftLanguageVersions: [.v5])
