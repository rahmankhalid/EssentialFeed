//
//  RemoteFeedLoaderTest.swift
//  EssentialFeedTests
//
//  Created by Khalid Rahman on 04/02/2021.
//

import XCTest

class RemoteFeedLoader {
    
    let client  : HTTPClient
    let url     : URL
    
    init(url: URL, client: HTTPClient) {
        self.url    = url
        self.client = client
    }
    
    func load() {
        client.get(from: url)
    }
    
}

protocol HTTPClient {
    func get(from url: URL)
}

class RemoteFeedLoaderTest: XCTestCase {

    func test_init_doesNotRequestDataFromUrl() {
        let (_, client)   = makeSUT()
        
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let url             = URL(string: "https://www.google.com")!
        let (sut, client)   = makeSUT(url: url)
        
        sut.load()
        
        XCTAssertEqual(client.requestedURL, url)
    }
    
    // MARK:- Helpers
    
    private func makeSUT(url: URL = URL(string: "https://www.google.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client          = HTTPClientSpy()
        let sut             = RemoteFeedLoader(url: url, client: client)
        return(sut, client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        
        var requestedURL  : URL?
        
        func get(from url: URL) {
            requestedURL = url
        }
    }

}
