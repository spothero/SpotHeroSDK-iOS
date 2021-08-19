// swift-tools-version:5.3
// Copyright © 2021 SpotHero, Inc. All rights reserved.

import PackageDescription

let package = Package(
    name: "SpotHeroSDK",
    platforms: [
        .iOS(.v10),         // supports UtilityBelt
        .macOS(.v10_12),    // supports UtilityBelt
        .tvOS(.v10),        // supports UtilityBelt
        .watchOS(.v3),      // supports UtilityBelt
    ],
    products: [
        .library(name: "SpotHeroAPINext", targets: ["SpotHeroAPINext"]),
        // Dynamic Libraries
        // These libraries are required due to the Xcode 11.3+ static linking bug: https://bugs.swift.org/browse/SR-12303
        .library(name: "SpotHeroAPINextDynamic", type: .dynamic, targets: ["SpotHeroAPINext"]),
    ],
    dependencies: [
        .package(name: "UtilityBelt", url: "https://github.com/spothero/UtilityBelt-iOS", .branch("adapt-and-retry")),
    ],
    targets: [
        .target(
            name: "SpotHeroAPINext",
            dependencies: [
                .product(name: "UtilityBeltNetworking", package: "UtilityBelt"),
            ],
            path: "Sources/SpotHeroAPI"
        ),
        .testTarget(
            name: "SpotHeroAPITests",
            dependencies: [
                .product(name: "Sham", package: "UtilityBelt"),
                .product(name: "Sham_XCTestSupport", package: "UtilityBelt"),
                .target(name: "SpotHeroAPINext"),
            ],
            resources: [.process("Resources")]
        ),
    ]
)
