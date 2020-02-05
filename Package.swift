// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MagicaVoxel",
    platforms: [
        .iOS(SupportedPlatform.IOSVersion.v12),
        .macOS(SupportedPlatform.MacOSVersion.v10_10)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "MagicaVoxel",
            targets: ["MagicaVoxel"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/markdaws/Utils", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "MagicaVoxel",
            dependencies: ["Utils"]),
        .testTarget(
            name: "MagicaVoxelTests",
            dependencies: ["MagicaVoxel"]),
    ]
)
