//
//  File.swift
//  
//
//  Created by Jeff Doar on 11/18/23.
//

import Foundation
import Vapor

struct FileQueryParams : Content {
    var email : String?
    var folder : String?
}

struct FileRecord : Content {
    public var id: String
    public var kind: String
    public var mimeType: String
    public var name: String
}

protocol GoogleFileProvider {
    func doSomething() -> Int;
}

class GoogleFileProviderImpl : GoogleFileProvider {
    public func doSomething() -> Int {
        return 1;
    }
}

extension Application {
    var fileProvider: GoogleFileProvider {
        return GoogleFileProviderImpl()
    }
}

struct FilesController : RouteCollection {
    func boot (routes: RoutesBuilder) throws {
        let files = routes.grouped("files")
        files.get(use: getFiles)
    }
    
    func getFiles(req: Request) async throws -> [FileRecord] {
        let fqp = try req.query.decode(FileQueryParams.self)
        
        // email is required
        if fqp.email == nil {
            throw Abort(.badRequest)
        }
        
        let reqEmail = fqp.email!
        let reqFolder = fqp.folder ?? ""

        return []
    }
}
