// swift-tools-version: 5.6

import PackageDescription

let package = Package(
		name: "Uptech iOS Helpers",
		platforms: [.iOS(.v11)],
		products: [
				.library(name: "Uptech iOS Helpers", targets: ["Uptech iOS Helpers"]),
		],
		targets: [
				.target(name: "Uptech iOS Helpers", dependencies: []),
				.testTarget(name: "Uptech iOS Helpers Tests", dependencies: ["Uptech iOS Helpers"]),
		]
)
