// swift-tools-version:5.2
// Copyright © 2020 SpotHero, Inc. All rights reserved.

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
        .library(name: "SpotHeroAPI", targets: ["SpotHeroAPINext"]),
    ],
    dependencies: [
        .package(name: "UtilityBelt", url: "https://github.com/spothero/UtilityBelt-iOS", from: "0.5.5"),
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
                .target(name: "SpotHeroAPINext"),
            ]
        ),
    ]
)
