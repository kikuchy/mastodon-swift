// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "mastodon",
    dependencies: [
        .Package(url: "https://github.com/Kuniwak/MirrorDiffKit.git", "1.0.1")
    ]
)
