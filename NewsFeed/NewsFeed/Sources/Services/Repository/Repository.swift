//
//  NetworkService.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

protocol Repository {
    associatedtype Model: Codable

    func getAllData() -> [Model]
    func getDataWith(filter: String) -> [Model]
    func save(_ model: Model)
    func save(_ models: [Model])
}
