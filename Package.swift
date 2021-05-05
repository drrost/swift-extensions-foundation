// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ExtensionsFoundation",
    products: [
        .library(
            name: "ExtensionsFoundation",
            targets: ["ExtensionsFoundation"]),
        .library(
            name: "ExtensionXCTest",
            targets: ["ExtensionXCTest"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ExtensionsFoundation",
            dependencies: []),
        .target(
            name: "ExtensionXCTest",
            dependencies: ["ExtensionsFoundation"]),
        .testTarget(
            name: "ExtensionsFoundationTests",
            dependencies: ["ExtensionsFoundation"]),
    ]
)
