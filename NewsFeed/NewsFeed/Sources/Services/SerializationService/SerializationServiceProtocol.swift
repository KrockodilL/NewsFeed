//
//  SerializationServiceProtocol.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import Foundation
import Foundation

protocol SerializationServiceProtocol {
    func serialize<T: Encodable>(_ value: T) throws -> Data
    func deserialize<T: Decodable>(_ data: Data) throws -> T
}
