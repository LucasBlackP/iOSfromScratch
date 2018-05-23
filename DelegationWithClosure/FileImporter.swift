//
//  FileImporter.swift
//  CustomCell
//
//  Created by Thang Tran on 5/23/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation

// AnyObject or class is the same
protocol FileImporterDelegate: class {
    
    // remove because we change in class with closure
//    func fileImporter(_ importer: FileImporter,
//                      shouldImportFile file: File) -> Bool
    
    func fileImporter(_ importer: FileImporter,
                      didAbortWithError error: Error)
    
    func fileImporterDidFinish(_ importer: FileImporter)
}

struct FileImporterConfiguration {
    var predicate: (File) -> Bool
    var errorHandler: (Error) -> Void
    var completionHandler: () -> Void
}

extension FileImporterConfiguration {
    init(predicate: @escaping (File) -> Bool) {
        self.predicate = predicate
        errorHandler = { _ in }
        completionHandler = {}
    }
}

extension FileImporterConfiguration {
    static var importAll: FileImporterConfiguration {
        return .init { _ in true }
    }
}

class File {
    
}

class FileImporter {
    
    weak var delegate: FileImporterDelegate?
    
 //   private let predicate: (File) -> Bool
    
    private let configuration: FileImporterConfiguration
    
    init(configuration: FileImporterConfiguration) {
        self.configuration = configuration
    }


//    init(predicate: @escaping (File) -> Bool) {
//        self.predicate = predicate
//    }
    
    private func processFileIfNeeded(_ file: File) {
        let shouldImport = configuration.predicate(file)
        
        guard shouldImport else {
            return
        }
        
        process(file)
    }
    
    private func handle(_ error: Error) {
        configuration.errorHandler(error)
    }
    
    private func importDidFinish() {
        configuration.completionHandler()
    }
    
    private func process(_ file: File) {
        
    }
}
