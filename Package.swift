// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "MediaPicker",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "MediaPicker",
            targets: ["MediaPicker"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MediaPicker",
            dependencies: []
        ),
        .testTarget(
            name: "MediaPickerTests",
            dependencies: ["MediaPicker"]),
    ]
)
