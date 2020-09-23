//
//  FeedMapper.swift
//  NewsFeed
//
//  Created by o.sinev on 17.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import Foundation

final class FeedMapper {

    static func convertNetwork(_ models: [NewsNetwork]) -> [News] {
        return models.map { $0.plainModel }
    }

}
