//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Khalid Rahman on 03/02/2021.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}


protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
