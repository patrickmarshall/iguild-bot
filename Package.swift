// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iguild-bot",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "TelegramBotSDK", url: "https://github.com/zmeyc/telegram-bot-swift.git", from: "2.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "iguild-bot",
            dependencies: ["TelegramBotSDK"]),
        .testTarget(
            name: "iguild-botTests",
            dependencies: ["iguild-bot"]),
    ]
)
