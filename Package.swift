// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PentryPal",
    targets: [
        .executableTarget(
            name: "PentryPal",
            path: "Sources"),
        .testTarget(
            name: "PentryPalTests",
            dependencies: ["PentryPal"],
            path: "Tests")
    ]
)
