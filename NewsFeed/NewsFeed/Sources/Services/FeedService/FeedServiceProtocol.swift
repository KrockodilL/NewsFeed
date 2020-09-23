//
//  FeedServiceProtocol.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import RxSwift

protocol FeedServiceProtocol {

    func getNewsFeed(for resources: [Source]) -> Single<NewsResponse>
    func getNewsFeedFromCache() -> [News]
    func setNewsWasRead(with id: String)
    func getAllSeenNews() -> [News]
    func save(_ news: [News])
    func getNewsFeedFromCache(with sources: [Source]) -> [News]

}
