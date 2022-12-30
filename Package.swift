// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "JOSESwift",
    platforms: [.iOS(.v11)],
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
