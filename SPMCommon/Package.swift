// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "SPMCommon",
    platforms: [.iOS(.v13), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(
            name: "SPMCommon",
            targets: ["SPMCommon"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SPMCommon",
            dependencies: []),
        .testTarget(
            name: "SPMCommonTests",
            dependencies: ["SPMCommon"]),
    ]
)
