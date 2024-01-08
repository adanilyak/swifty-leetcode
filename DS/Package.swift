// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DS",
    products: [
        .library(
            name: "DS",
            targets: ["DS"]
        ),
    ],
    targets: [
        .target(
            name: "DS"
        ),
        .testTarget(
            name: "DSTests",
            dependencies: ["DS"]
        ),
    ]
)
