import Foundation
import SwiftPackageDescriptionDecodable

public struct PackageDescriptionLoader {
    public init() {}
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

// MARK: - Loading
extension PackageDescriptionLoader {
    public func load(path: String) throws -> String {
        let path = path.dropSuffix("Package.swift")
        return try shell("swift package describe --type json", currentDirectory: path)
    }
}

// MARK: - Decoding
extension PackageDescriptionLoader {
    public func decode(path: String) throws -> DescribedPackage {
        try decode(json: load(path: path))
    }
    
    public func decode(json: String) throws -> DescribedPackage {
        guard let data = json.data(using: .utf8) else {
            throw PackageDescriptionLoaderError.couldNotConvertJsonToData
        }
        
        return try decode(data: data)
    }
    
    public func decode(data: Data) throws -> DescribedPackage {
        try decoder.decode(DescribedPackage.self, from: data)
    }
}

extension String {
    func dropSuffix(_ suffix: String) -> String {
        guard hasSuffix(suffix) else { return self }
        return String(dropLast(suffix.count))
    }
}
