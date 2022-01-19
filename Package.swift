// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Hexagram",
    products: [
        .library(
            name: "Hexagram",
            targets: ["Hexagram"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Hexagram",
            dependencies: []),
        .testTarget(
            name: "HexagramTests",
            dependencies: ["Hexagram"]),
    ]
)
