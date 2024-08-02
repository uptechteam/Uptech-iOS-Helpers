// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "Uptech-iOS-Helpers",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "UptechFoundationHelper", targets: ["UptechFoundationHelper"]),
        .library(name: "UptechUIKitHelper", targets: ["UptechUIKitHelper"])
    ],
    targets: [
        .target(name: "UptechFoundationHelper", path: "Sources/Uptech-iOS-Helpers/FoundationHelper"),
        .target(name: "UptechUIKitHelper", path: "Sources/Uptech-iOS-Helpers/UIKitHelper"),
        .testTarget(name: "FoundationHelper-Test",
                    dependencies: ["UptechFoundationHelper"],
                    path: "Tests/Uptech-iOS-Helpers-Tests/FoundationHelper"),
        .testTarget(name: "UIKitHelper-Test",
                    dependencies: ["UptechUIKitHelper"],
                    path: "Tests/Uptech-iOS-Helpers-Tests/UIKitHelper")
    ]
)
