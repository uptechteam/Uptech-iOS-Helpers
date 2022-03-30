// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Uptech iOS Helpers",
		platforms: [.iOS(.v11)],
    products: [
        .library(name: "Uptech Helpers", targets: ["Uptech Helpers"]),
    ],
    targets: [
        .target(name: "Uptech Helpers", dependencies: []),
        .testTarget(name: "Uptech HelpersTests", dependencies: ["Uptech Helpers"]),
    ]
)
