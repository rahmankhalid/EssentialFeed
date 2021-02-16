//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Khalid Rahman on 12/02/2021.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
