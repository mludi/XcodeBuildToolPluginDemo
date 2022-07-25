import Foundation
import PackagePlugin

@main
struct SwiftGenPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        print("Nothing to see here.")
        return []
    }
}

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

extension SwiftGenPlugin: XcodeBuildToolPlugin {
    func createBuildCommands(context: XcodePluginContext, target: XcodeTarget) throws -> [Command] {
        let swiftGenOutputDirectory = context.pluginWorkDirectory.appending("SwiftGenOutputs")
        try FileManager.default.createDirectory(atPath: swiftGenOutputDirectory.string, withIntermediateDirectories: true)

        let configFile = context.xcodeProject.directory.appending(subpath: "swiftgen.yml")
        let executable = try context.tool(named: "swiftgen").path

        let arguments = [
            "config",
            "run",
            "--verbose",
            "--config", "\(configFile)"
        ]

        let environment = [
            "PROJECT_DIR": "\(context.pluginWorkDirectory)",
            "TARGET_NAME": "\(target.displayName)",
            "DERIVED_SOURCES_DIR": "\(swiftGenOutputDirectory)",
        ]

        return [
            .prebuildCommand(
                displayName: "Running SwiftGen",
                executable: executable,
                arguments: arguments,
                environment: environment,
                outputFilesDirectory: swiftGenOutputDirectory
            )
        ]
    }
}
#endif
