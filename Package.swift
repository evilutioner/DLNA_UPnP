// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "DLNA_UPnP",
    platforms: [
        .iOS(.v8)
    ],
    products: [
        .library(
            name: "DLNA_UPnP",
            targets: ["UPnP", "GData"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/robbiehanson/CocoaAsyncSocket.git", from: "7.6.5")
    ],
    targets: [
        .target(
            name: "UPnP",
            dependencies: [
                "GData",
                .product(name: "CocoaAsyncSocket", package: "CocoaAsyncSocket")
            ],
            path: "DLNA_UPnP/Classes/UPnP",
            publicHeadersPath: ""
        ),
        .target(
            name: "GData",
            path: "DLNA_UPnP/Classes/GData",
            publicHeadersPath: "",
            cSettings: [
                .unsafeFlags(["-fno-objc-arc"])
            ]
        ),
    ]
)
