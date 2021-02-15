// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ExtensionsFoundation",
    products: [
        .library(
            name: "ExtensionsFoundation",
            targets: ["ExtensionsFoundation"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ExtensionsFoundation",
            dependencies: []),
        .testTarget(
            name: "ExtensionsFoundationTests",
            dependencies: ["ExtensionsFoundation"]),
    ]
)
