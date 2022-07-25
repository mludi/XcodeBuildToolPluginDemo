// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XcodePackagePlugins",
    defaultLocalization: "en",
    products: [
        .plugin(
            name: "SwiftGenPlugin",
            targets: [
                "SwiftGenPlugin"
            ]
        )
    ],
    dependencies: [],
    targets: [
        .plugin(
            name: "SwiftGenPlugin",
            capability: .buildTool(),
            dependencies: [
                "SwiftGenBinary",
            ]
        ),
        .binaryTarget(
            name: "SwiftGenBinary",
            path: "Binaries/SwiftGenBinary.artifactbundle"
        ),
    ]
)
