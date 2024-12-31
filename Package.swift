// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "Uptech-iOS-Helpers",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "Uptech-iOS-Helpers", targets: ["UptechFoundationHelper", "UptechUIKitHelper", "UptechSwiftUIHelper"]),
        .library(name: "UptechFoundationHelper", targets: ["UptechFoundationHelper"]),
        .library(name: "UptechUIKitHelper", targets: ["UptechUIKitHelper"]),
        .library(name: "UptechSwiftUIHelper", targets: ["UptechSwiftUIHelper"])
    ],
    targets: [
        .target(name: "UptechFoundationHelper", path: "Sources/Uptech-iOS-Helpers/FoundationHelper"),
        .target(name: "UptechUIKitHelper", path: "Sources/Uptech-iOS-Helpers/UIKitHelper"),
        .target(name: "UptechSwiftUIHelper", path: "Sources/Uptech-iOS-Helpers/SwiftUIHelper"),
        .testTarget(name: "FoundationHelper-Test",
                    dependencies: ["UptechFoundationHelper"],
                    path: "Tests/Uptech-iOS-Helpers-Tests/FoundationHelper"),
        .testTarget(name: "UIKitHelper-Test",
                    dependencies: ["UptechUIKitHelper"],
                    path: "Tests/Uptech-iOS-Helpers-Tests/UIKitHelper")
    ]
)
