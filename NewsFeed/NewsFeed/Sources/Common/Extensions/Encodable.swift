//
//  Encodable.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import Foundation

extension Encodable {

    func convert<T: Codable>(to type: T.Type) -> T? {
        do {
            let data = try JSONEncoder().encode(self)
            return try JSONDecoder().decode(T.self, from: data)
        } catch let error {
            print("Convert error: \(error)")
            return nil
        }
    }

}
