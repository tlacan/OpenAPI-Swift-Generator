// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Dymatrip",
    platforms: [
        .macOS(.v13),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-openapi-generator", .upToNextMinor(from: "1.2.1")),
        .package(url: "https://github.com/apple/swift-openapi-runtime", .upToNextMinor(from: "1.4.0")),
        .package(url: "https://github.com/swift-server/swift-openapi-vapor", .upToNextMinor(from: "1.0.1")),
        .package(url: "https://github.com/vapor/vapor", .upToNextMajor(from: "4.101.2")),
    ],
    targets: [
        .executableTarget(
            name: "Dymatrip",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .product(name: "OpenAPIVapor", package: "swift-openapi-vapor"),
                .product(name: "Vapor", package: "vapor"),
            ],
            resources: [
                .copy("openapi-generator-config.yaml"),
                .copy("openapi.yaml"),
            ],
            plugins: [.plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator")]
        ),
    ]
)