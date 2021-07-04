// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "RDFoundation",
    products: [
        .library(
            name: "RDFoundation",
            targets: ["RDFoundation"]),
        .library(
            name: "RDTest",
            targets: ["RDTest"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "RDFoundation",
            dependencies: []),
        .target(
            name: "RDTest",
            dependencies: ["RDFoundation"]),
        .testTarget(
            name: "RDFoundationTests",
            dependencies: ["RDFoundation"]),
    ]
)
