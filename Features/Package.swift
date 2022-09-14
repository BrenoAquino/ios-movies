// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [.iOS(.v15),],
    products: [
        .library(
            name: "Features",
            targets: ["Home"]),
    ],
    dependencies: [
        .package(name: "Domain", path: "../Domain"),
    ],
    targets: [
        .target(
            name: "Previews",
            dependencies: ["Domain"]),
        .target(
            name: "DesignSystem",
            dependencies: []),
        .target(
            name: "Home",
            dependencies: ["Previews", "DesignSystem", "Domain"]),
    ]
)
