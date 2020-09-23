//
//  FeedService.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import RxSwift

final class FeedService: FeedServiceProtocol {

    private let networkService: NetworkServiceProtocol
    private let newsFeedRepository: AnyRepository<News>

    init(with networkService: NetworkServiceProtocol, newsFeedRepository: AnyRepository<News>) {
        self.networkService = networkService
        self.newsFeedRepository = newsFeedRepository
    }

    func getNewsFeed(for resources: [Source]) -> Single<NewsResponse> {
        var query = "?sources="
        query += resources.map { $0.rawValue }.joined(separator: ",")
        let request = Request(query: query, method: .get)
        return networkService.data(for: request)
    }

    func getNewsFeedFromCache() -> [News] {
        return newsFeedRepository.getAllData()
    }

    func getNewsFeedFromCache(with sources: [Source]) -> [News] {
        return newsFeedRepository.getAllData().filter { news in
            sources.first(where: { $0.rawValue == news.source.id }) != nil
        }
    }

    func getAllSeenNews() -> [News] {
        return newsFeedRepository.getDataWith(filter: "wasSeen == true")
    }

    func save(_ news: [News]) {
        newsFeedRepository.save(news)
    }

    func setNewsWasRead(with id: String) {
        guard var news = newsFeedRepository.getDataWith(filter: id.realmFilterFromId).first else {
            return
        }
        news.wasSeen = true
        newsFeedRepository.save(news)
    }

}
