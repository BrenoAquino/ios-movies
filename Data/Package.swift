// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [.iOS(.v13), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(
            name: "Data",
            targets: ["Data"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Data",
            dependencies: []),
        .testTarget(
            name: "DataTests",
            dependencies: ["Data"]),
    ]
)
