# SwiftPackageDescriptionLoader

Uses Swift Package Manager's `swift package describe --type json` command to load a `PackageDescription` object.

Intended for use by tools that wish to introspect a package's dependencies, targets, etc. using the Swift language.
