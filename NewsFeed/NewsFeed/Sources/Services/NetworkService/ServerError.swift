//
//  ServerError.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import Foundation

enum ServerError: Error {

    static let parametersMissingCode = "parametersMissing"

    case invalidResponse(underlyingError: ApiError)
    case invalidURL

}

struct ApiError: Decodable {

    let status: String
    let code: String
    let message: String

}
