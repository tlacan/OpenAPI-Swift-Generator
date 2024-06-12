//
//  GenServer.swift
//  SampleService
//
//  Created by thomas lacan on 12/06/2024.
//

import Foundation
import OpenAPIRuntime
import OpenAPIVapor
import Vapor

struct Handler: APIProtocol {

}

@main
struct SampleService {
    public static func main() throws {
        let app = Vapor.Application()
        
        let transport = VaporTransport(routesBuilder: app)
        let handler = Handler()
        try handler.registerHandlers(on: transport, serverURL: try Servers.server1())
        try app.run()
    }
}
