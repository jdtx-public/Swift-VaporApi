//
//  File.swift
//  
//
//  Created by Jeff Doar on 11/18/23.
//

import Foundation
import Vapor

struct FileRecord : Content {
    public var id: String
    public var kind: String
    public var mimeType: String
    public var name: String
}

struct FilesController : RouteCollection {
    func boot (routes: RoutesBuilder) throws {
        let files = routes.grouped("files")
        files.get(use: getFiles)
    }
    
    func getFiles(req: Request) async throws -> [FileRecord] {
        return []
    }
}