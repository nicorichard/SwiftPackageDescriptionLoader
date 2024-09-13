import Foundation

@discardableResult
func shell(_ command: String, currentDirectory: String) throws -> String {
    let task = Process()
    let env = ProcessInfo.processInfo.environment
    
    task.arguments = ["-c", command]
    task.launchPath = env["SHELL"]
    task.currentDirectoryPath = currentDirectory
    
    let pipe = Pipe()
    task.standardOutput = pipe
    try task.run()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    guard let output = String(data: data, encoding: .utf8) else {
        throw PackageDescriptionLoaderError.shellOutputFormatInvalid
    }
    
    return output
}
