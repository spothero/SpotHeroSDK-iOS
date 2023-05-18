// swift-tools-version:5.6
// Copyright © 2023 SpotHero, Inc. All rights reserved.

import PackageDescription

let package = Package(
    name: "SpotHeroSDK",
    platforms: [
        .iOS(.v11),         // supports UtilityBelt
        .macOS(.v10_12),    // supports UtilityBelt
        .tvOS(.v10),        // supports UtilityBelt
        .watchOS(.v3),      // supports UtilityBelt
    ],
    products: [
        .library(name: "SpotHeroAPINext", targets: ["SpotHeroAPINext"]),
    ],
    dependencies: [
        .package(url: "https://github.com/spothero/UtilityBelt-iOS", .upToNextMinor(from: "0.14.0")),
    ],
    targets: [
        .target(
            name: "SpotHeroAPINext",
            dependencies: [
                .product(name: "UtilityBeltNetworking", package: "UtilityBelt-iOS"),
            ],
            path: "Sources/SpotHeroAPI"
        ),
        .testTarget(
            name: "SpotHeroAPITests",
            dependencies: [
                .product(name: "Sham", package: "UtilityBelt-iOS"),
                .product(name: "Sham_XCTestSupport", package: "UtilityBelt-iOS"),
                .target(name: "SpotHeroAPINext"),
            ],
            resources: [.process("Resources")]
        ),
    ]
)
