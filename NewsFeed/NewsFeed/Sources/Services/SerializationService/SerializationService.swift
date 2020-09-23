//
//  SerializationService.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import Foundation

final class SerializationService {

    // MARK: - Properties
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    init() {
        encoder.keyEncodingStrategy = .convertToSnakeCase
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
    }

}

extension SerializationService: SerializationServiceProtocol {

    func serialize<T>(_ value: T) throws -> Data where T: Encodable {
        return try encoder.encode(value)
    }

    func deserialize<T>(_ data: Data) throws -> T where T: Decodable {
        return try decoder.decode(T.self, from: data)
    }

}
