//
//  Logger.swift
//  EstonianWeather
//
//  Created by Andrius Shiaulis on 28.09.2020.
//

import Foundation

public protocol LoggerModule {
    var name: String { get }
}

public extension LoggerModule {
    var name: String { String(describing: Self.self) }
}

public protocol Logger {

    init(loggerModule: LoggerModule)

    func log(message: String, error: Error)
    func logNotImplemented(functionality: String)
    func log(information: String)
    func log(successState: String)

}

public final class PrintLogger {

    // MARK: - Properties

    private let module: LoggerModule

    private var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        dateFormatter.locale = .current
        return dateFormatter.string(from: Date())
    }

    // MARK: - Init

    public init(loggerModule: LoggerModule) {
        self.module = loggerModule
    }



    private func log(_ string: String) {
        print("\(self.currentDate): \(string)")
    }
}

extension PrintLogger: Logger {

    public func log(message: String, error: Error) {
        log("❌ \(module.name): \(message) Error: \(error.localizedDescription)")
        assertionFailure()
    }

    public func logNotImplemented(functionality: String) {
        log("🚧 \(module.name): \(functionality) not implemented yet")
    }

    public func log(information: String) {
        log("ℹ️ \(module.name): \(information)")
    }

    public func log(successState: String) {
        log("✅ \(module.name): \(successState)")
    }

}
