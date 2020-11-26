import ArgumentParser

// MARK: - Common Arguments

struct LintOrAnalyzeArguments: ParsableArguments {
    @Option(help: "The path to one or more SwiftLint configuration files, evaluated as a parent-child hierarchy.")
    var config = [String]()
    @Flag(name: [.long, .customLong("autocorrect")], help: "Correct violations whenever possible.")
    var fix = false
    @Flag(help: "Use an alternative algorithm to exclude paths for `excluded`, which may be faster in some cases.")
    var useAlternativeExcluding = false
    @Flag(help: "Read SCRIPT_INPUT_FILE* environment variables as files.")
    var useScriptInputFiles = false
    @Flag(help: "Upgrades warnings to serious violations (errors).")
    var strict = false
    @Flag(help: "Downgrades serious violations to warnings, warning threshold is disabled.")
    var lenient = false
    @Flag(help: "Exclude files in config `excluded` even if their paths are explicitly specified.")
    var forceExclude = false
    @Flag(help: "Save benchmarks to `benchmark_files.txt` and `benchmark_rules.txt`.")
    var benchmark = false
    @Option(help: "The reporter used to log errors and warnings.")
    var reporter: String?
}

// MARK: - Common Argument Help

// It'd be great to be able to parameterize an `@OptionGroup` so we could move these options into
// `LintOrAnalyzeArguments`.

func pathOptionDescription(for mode: LintOrAnalyzeMode) -> ArgumentHelp {
    "The path to the file or directory to \(mode.imperative)."
}

func pathsArgumentDescription(for mode: LintOrAnalyzeMode) -> ArgumentHelp {
    "List of paths to the files or directories to \(mode.imperative)."
}

func quietOptionDescription(for mode: LintOrAnalyzeMode) -> ArgumentHelp {
    "Don't print status logs like '\(mode.verb.capitalized) <file>' & 'Done \(mode.verb)'."
}
