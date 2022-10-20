// swift-tools-version: 5.7

///
import PackageDescription

///
let package = Package(
    name: "DatedModule",
    products: [
        .library(
            name: "DatedModule",
            targets: ["DatedModule"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DatedModule",
            dependencies: []
        ),
        .testTarget(
            name: "DatedModule_tests",
            dependencies: ["DatedModule"]
        ),
    ]
)
