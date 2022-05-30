// swift-tools-version: 5.5

import PackageDescription

let package = Package(
		name: "Uptech-iOS-Helpers",
		platforms: [.iOS(.v11)],
		products: [
                .library(name: "FoundationUptech", targets: ["FoundationUptech"]),
                .library(name: "UIKitUptech", targets: ["UIKitUptech"])
		],
		targets: [
				.target(name: "FoundationUptech", path: "Sources/Uptech-iOS-Helpers/FoundationUptech"),
                .target(name: "UIKitUptech", path: "Sources/Uptech-iOS-Helpers/UIKitUptech"),
                .testTarget(name: "FoundationUptech-Test",
                            dependencies: ["FoundationUptech"],
                            path: "Tests/Uptech-iOS-Helpers-Tests/FoundationUptech"),
                .testTarget(name: "UIKitUptech-Test",
                            dependencies: ["UIKitUptech"],
                            path: "Tests/Uptech-iOS-Helpers-Tests/UIKitUptech")
//				.testTarget(name: "Uptech-iOS-Helpers-Tests", dependencies: ["FoundationUptech", "UIKitUptech"]),
		]
)
