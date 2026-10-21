// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-form-coding",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "FormCoding", targets: ["FormCoding"])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-compositions/swift-url-form-coding.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-multipart-form-coding.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "FormCoding",
            dependencies: [
                .product(name: "URLFormCoding", package: "swift-url-form-coding"),
                .product(name: "MultipartFormCoding", package: "swift-multipart-form-coding"),
            ]
        ),
        .testTarget(
            name: "FormCoding Tests",
            dependencies: ["FormCoding"]
        ),
    ]
)

for target in package.targets {
    target.swiftSettings =
        (target.swiftSettings ?? []) + [
            .enableUpcomingFeature("MemberImportVisibility")
        ]
}
