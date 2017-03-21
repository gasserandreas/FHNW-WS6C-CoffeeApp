//
//  CommunicationManager.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 13.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import Foundation

// needed for singleton
struct FileManagerStatic {
    static var onceToken: Int = 0
    static var instance: FileManager? = nil
}

class FileManager {
    
    // singleton instance
    private static var __once: () = { () -> Void in
        FileManagerStatic.instance = FileManager()
    }()
    
    class var sharedInstance : FileManager {
        _ = FileManager.__once
        return FileManagerStatic.instance!
    }
    
    fileprivate lazy var fileManager:Foundation.FileManager = {
        return Foundation.FileManager.default
    }()
    
    fileprivate let dataType = "json"
    
    fileprivate var applicationDocumentsDirectory: URL? {
        get {
            var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(Foundation.FileManager.SearchPathDirectory.documentDirectory, Foundation.FileManager.SearchPathDomainMask.userDomainMask, true) as [AnyObject]
            if paths.count > 0 {
                if let pathString = paths[0] as? NSString {
                    return URL(string: pathString as String)
                }
            }
            return nil
        }
    }
    
    fileprivate func createPathToFileName(_ filename: String) -> String? {
        if let directoryPath = applicationDocumentsDirectory?.path {
            return directoryPath + "/" + filename + "." + dataType
        }
        return nil
    }
    
    fileprivate func checkIfFileExistsAtPath(_ path: String) -> Bool {
        return fileManager.fileExists(atPath: path)
    }
    
    fileprivate func saveContentToFileAtPath(_ data: Data, path: String) {
        // check if file exists
        if checkIfFileExistsAtPath(path) {
            do {
                try data.write(to: URL(fileURLWithPath: path), options: [.atomic])
            } catch { NSLog("could not write") }
        } else {
            fileManager.createFile(atPath: path, contents: data, attributes: nil)
        }
    }
    
    func loadFileFromDocuments(_ filename: String) -> String? {
        return createPathToFileName(filename)
    }
    
    func loadContentOfFileAtPath(_ path: String) -> [Any]? {
        var returnValue: [Any]?
        var fileContent: String?
        do {
            fileContent = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
        } catch { fileContent = nil }
        
        
        if let data = fileContent?.data(using: String.Encoding.utf8, allowLossyConversion: true) {
            do {
                returnValue = try JSONSerialization.jsonObject(with: data, options: []) as? [Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        
        return returnValue
    }
    
    func saveContentToDocumentsDirectory(_ data: Data, fileName: String) {
        if let path = createPathToFileName(fileName) {
            saveContentToFileAtPath(data, path: path)
        }
    }
    
}
