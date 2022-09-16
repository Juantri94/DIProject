// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "ExternalDependencies",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Appboy", targets: ["Appboy"]),
        .library(name: "Environment", targets: ["Environment"]),
        .library(name: "AmplitudeEventTracker", targets: ["AmplitudeEventTracker"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/braze-inc/braze-ios-sdk.git",
            from: "3.33.1"
        ),
        .package(
            url: "https://github.com/amplitude/Amplitude-iOS.git",
            exact: "8.11.0"
        )
    ],
    targets: [
        // Appboy
        .target(
            name: "Appboy",
            dependencies: [
                .product(name: "AppboyKit", package: "braze-ios-sdk"),
                .target(name: "Environment")
            ]
        ),

        // Environment
        .target(name: "Environment"),

        // Amplitude Event Tracker
        .target(
            name: "AmplitudeEventTracker",
            dependencies: [
                .product(name: "Amplitude", package: "Amplitude-iOS"),
                .target(name: "Environment")
            ]
        ),
        .testTarget(
            name: "AmplitudeEventTrackerTests",
            dependencies: ["AmplitudeEventTracker"]
        )
    ]
)
