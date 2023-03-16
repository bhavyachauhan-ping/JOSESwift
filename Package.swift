// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "JOSESwift",
    platforms: [.iOS(.v11)],
    products: [
        .library(name: "JOSESwift", targets: ["JOSESwift"])
    ],
    dependencies: [
        .package(url: "https://github.com/bhavyachauhan-ping/secp256k1.swift", branch: "libsecp256k1")
    ],
    targets: [
        .target(name: "JOSESwift",
                dependencies: [.product(name: "libsecp256k1", package: "secp256k1.swift")],
                path: "JOSESwift")
    ],
    swiftLanguageVersions: [.v5])
