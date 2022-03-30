// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Uptech Helpers",
		platforms: [.iOS(.v11)],
    products: [
        .library(name: "Uptech Helpers", targets: ["Uptech Helpers"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "Uptech Helpers", dependencies: []),
        .testTarget(name: "Uptech HelpersTests", dependencies: ["Uptech Helpers"]),
    ]
)
