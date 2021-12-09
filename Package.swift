// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TriforkSwiftExtensions",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(
            name: "TriforkSwiftExtensions",
            targets: ["TriforkSwiftExtensions"]
        )
    ],

    targets: [
        .target(name: "TriforkSwiftExtensions",
                dependencies: [],
                path: "TriforkSwiftExtensions/TriforkSwiftExtensions"),
        .testTarget(name: "TriforkSwiftExtensionsTests",
                    dependencies: ["TriforkSwiftExtensions"],
                    path: "TriforkSwiftExtensions/TriforkSwiftExtensionsTests"),
    ]
)
