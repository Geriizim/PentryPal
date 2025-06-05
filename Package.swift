// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PentryPal",
    products: [
        .library(name: "Inventory", targets: ["Inventory"]),
        .executable(name: "PentryPal", targets: ["PentryPal"])
    ],
    targets: [
        // Library containing the inventory model and store.
        .target(
            name: "Inventory",
            path: "Sources/Inventory"),

        // Executable showcasing usage of the store. Kept simple for testing
        // purposes.
        .executableTarget(
            name: "PentryPal",
            dependencies: ["Inventory"],
            path: "Sources/PentryPal"),

        // Unit tests for the inventory functionality.
        .testTarget(
            name: "InventoryTests",
            dependencies: ["Inventory"],
            path: "Tests")
    ]
)
