//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Khalid Rahman on 03/02/2021.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
