# SwiftPackageDescriptionLoader

Uses Swift Package Manager's `swift package describe --type json` command to load a `PackageDescription`, then decodes it to [SwiftPackageDescriptionDecodable's](https://github.com/nicorichard/SwiftPackageDescriptionDecodable) decodable representation of Swift Package Manager's [DescribedPackage](https://github.com/apple/swift-package-manager/blob/main/Sources/Commands/Utilities/DescribedPackage.swift).

Intended for use by tools that wish to introspect a package's dependencies, targets, etc. using the Swift language.

> 🚨 The package description returned by Swift Package Manager makes no claims about stability. Future Swift updates will undoubtedly require updates to this package as well.

## Usage

```swift
import SwiftPackageDescriptionLoader

func loadDescribedPackage(path: String) throws -> DescribedPackage {
    try PackageDescriptionLoader().decode(path: path)
}
```

## Ideas

- Scrutinize `Package.swift` description changes from your [Danger-Swift](https://github.com/danger/swift)'s `Danger.swift` file or plugin
- Create a [SwiftLint](https://github.com/realm/SwiftLint)-like tool for linting package manifests
