//
//  NetworkService.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import RealmSwift

protocol RealmDataServiceProtocol {
    func getObjects<T: Object>(type: T.Type) -> [T]
    func getObjects<T: Object>(type: T.Type, filter: String) -> [T]
    func update<T: Object>(object: T)
}
