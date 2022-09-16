// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "InteralDependencies",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Bridge", targets: ["Bridge"]),
        .library(name: "FeatureA", targets: ["FeatureA"]),
        .library(name: "FeatureB", targets: ["FeatureB"]),
        .library(name: "FeatureC", targets: ["FeatureC"]),
        .library(name: "UIComponents", targets: ["UIComponents"])
    ],
    dependencies: [],
    targets: [
        // Bridge
        .target(name: "Bridge"),

        // FeatureA
        .target(name: "FeatureA",
                dependencies: ["Bridge", "UIComponents"]),

        // FeatureB
        .target(name: "FeatureB",
                dependencies: ["Bridge"]),

        // FeatureC
        .target(name: "FeatureC",
                dependencies: ["Bridge"]),

        // UIComponents
        .target(name: "UIComponents"),
    ]
)
