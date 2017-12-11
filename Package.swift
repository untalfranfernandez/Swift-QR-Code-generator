// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "QRCodeGenerator",
    products: [
        .library(name: "QRCodeGenerator", targets: ["QRCodeGenerator"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(name: "QRCodeGenerator", dependencies: ["QRCodeGenerator-Wrapper"]),
        .target(name: "QRCodeGenerator-Wrapper", dependencies: ["QRCodeGenerator-CPP"]),
        .target(name: "QRCodeGenerator-CPP", dependencies: []),
        .testTarget(name: "QRCodeGeneratorTests", dependencies: ["QRCodeGenerator", "QRCodeGenerator-Wrapper"]),
    ],
    cxxLanguageStandard: .cxx11
)

#if os(Linux)
    package.dependencies.append(.package(url:"https://github.com/fjfdeztoro/SwiftNUStep", from: "0.0.2"))
#endif