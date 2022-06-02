// swift-tools-version: 5.5

import PackageDescription

let package = Package(
		name: "Uptech-iOS-Helpers",
		platforms: [.iOS(.v11)],
		products: [
                .library(name: "FoundationHelper", targets: ["FoundationHelper"]),
                .library(name: "UIKitHelper", targets: ["UIKitHelper"])
		],
		targets: [
				.target(name: "FoundationHelper", path: "Sources/Uptech-iOS-Helpers/FoundationHelper"),
                .target(name: "UIKitHelper", path: "Sources/Uptech-iOS-Helpers/UIKitHelper"),
                .testTarget(name: "FoundationHelper-Test",
                            dependencies: ["FoundationHelper"],
                            path: "Tests/Uptech-iOS-Helpers-Tests/FoundationHelper"),
                .testTarget(name: "UIKitHelper-Test",
                            dependencies: ["UIKitHelper"],
                            path: "Tests/Uptech-iOS-Helpers-Tests/UIKitHelper")
		]
)
