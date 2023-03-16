// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "JOSESwift",
    platforms: [.iOS(.v11)],
    products: [
        .library(name: "JOSESwift", targets: ["JOSESwift"])
    ],
    dependencies: [.package(url: "https://github.com/bhavyachauhan-ping/secp256k1.swift", Package.Dependency.Requirement.branch("secp256k1lib"))],
    targets: [
        .target(name: "JOSESwift",
                dependencies: [.product(name: "secp256k1lib", package: "secp256k1.swift")],
                path: "JOSESwift")
    ],
    swiftLanguageVersions: [.v5])
