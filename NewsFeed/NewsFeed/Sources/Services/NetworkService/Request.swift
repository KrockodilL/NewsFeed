//
//  Request.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import UIKit

struct Request {

    // MARK: - Typealias
    typealias RequestParams = [String: Any]

    // MARK: - Properties
    let query: String
    let method: RequestMethod
    let bodyParameters: RequestParams?

    // MARK: - Init
    init(query: String, method: RequestMethod, bodyParameters: RequestParams? = nil) {
        self.query = query
        self.method = method
        self.bodyParameters = bodyParameters
    }

}

extension Request {

    enum RequestMethod: String {

        case get
        case post
        case delete
        case head
        case put
        case PATCH

    }

}
