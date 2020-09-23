//
//  NetworkService.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import RealmSwift

class RealmDataService: RealmDataServiceProtocol {

    // MARK: - Properties
    var realm: Realm?

    // MARK: - Init
    init() {
        do {
            Realm.Configuration.defaultConfiguration = Realm.Configuration(
                deleteRealmIfMigrationNeeded: true
            )
            realm = try Realm()
            print("Data service Realm path \(realm?.configuration.fileURL?.absoluteString ?? "not found")")
        } catch {
            print("Realm needs migration")
        }
    }

    func getObjects<T: Object>(type: T.Type) -> [T] {
        guard let objects = realm?.objects(T.self), !objects.isEmpty else {
            return []
        }
        return Array(objects)
    }

    func getObjects<T: Object>(type: T.Type, filter: String) -> [T] {
        guard let results = realm?.objects(T.self).filter(filter) else {
            return []
        }
        return Array(results)
    }

    func update<T: Object>(object: T) {
        try? realm?.write {
            realm?.add(object, update: .all)
        }
    }

//    func deleteAll<T: Object>(type: T.Type) {
//        let results = getObjects(type: type)
//        try? realm?.write {
//            realm?.delete(results)
//        }
//    }

}
