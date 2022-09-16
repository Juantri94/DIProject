//
//  ApiClient.swift
//  Environment
//
//  Created by Juantri Jimenez on 21/7/22.
//

import Foundation

public enum RequestType: String {
    case GET, POST, DELETE
}

public final class ApiClient {
    
    private let url: String
    private let defaultHeaders: [String: String]
    private let urlSession: URLSession

    public init(
        url: String,
        defaultHeaders: [String:String] = [:],
        urlSession: URLSession = URLSession.shared
    ) {
        self.url = url
        self.defaultHeaders = defaultHeaders
        self.urlSession = urlSession
    }

    public func request(
        endpoint: String,
        headers: [String: String] = [:],
        queryItems: [String : String] = [:],
        body: [String:Any]? = nil,
        httpMethod: RequestType
    ) async throws -> Data {
        print("Api request to: \(endpoint), type: \(httpMethod.rawValue)")
        return Data()
    }

}

public extension ApiClient {

    static func liveApiClient(
        url: String,
        defaultHeaders: [String: String]
    ) -> ApiClient {
        ApiClient(url: url, defaultHeaders: defaultHeaders)
    }

    #if DEBUG
    static func mockApiClient() -> ApiClient {
        ApiClient(url: "")
    }
    #endif
}
