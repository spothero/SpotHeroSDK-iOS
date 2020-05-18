// swift-tools-version:5.2
// Copyright © 2020 SpotHero, Inc. All rights reserved.

import PackageDescription

let package = Package(
    name: "SpotHeroSDK",
    products: [
        .library(name: "SpotHeroSDK", targets: ["SpotHeroSDK"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SpotHeroSDK",
            dependencies: []
        ),
        .testTarget(
            name: "SpotHeroSDKTests",
            dependencies: [
                .target(name: "SpotHeroSDK"),
            ]
        ),
    ]
)
