// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ScryfallApi",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ScryfallApi",
            targets: ["ScryfallApi"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ScryfallApi",
            dependencies: []),
        .testTarget(
            name: "ScryfallApiTests",
            dependencies: ["ScryfallApi"]),
    ]
)
