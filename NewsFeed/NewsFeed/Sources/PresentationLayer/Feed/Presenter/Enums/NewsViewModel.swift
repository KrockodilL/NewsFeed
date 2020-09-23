//
//  NewsViewModel.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import Foundation

struct NewsViewModel {

    let id: String
    let title: String
    let source: String
    let imageURL: String
    let description: String
    let date: String?
    var wasSeen: Bool
    var isCollapsed = true

    init(with news: News) {
        let dateConverter = DIContainer.dateConverter
        id = news.id
        title = news.title
        source = news.source.name
        description = news.description
        imageURL = news.urlToImage
        wasSeen = news.wasSeen
        date = dateConverter.getShortDateAndTime(fromString: news.publishedAt)
    }

}
