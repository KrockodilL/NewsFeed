//
//  NetworkService.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import RealmSwift

class RealmRepository<Model: Codable, BackType: Object & Codable>: Repository {

    // MARK: - Properties
    private let dataService: RealmDataServiceProtocol

    // MARK: - Init
    init(dataService: RealmDataServiceProtocol) {
        self.dataService = dataService
    }

    // MARK: - Repository
    func getAllData() -> [Model] {
        return dataService
            .getObjects(type: BackType.self)
            .map { $0.convert(to: Model.self) }
            .compactMap { $0 }
    }

    func getDataWith(filter: String) -> [Model] {
        return dataService
            .getObjects(type: BackType.self, filter: filter)
            .map { $0.convert(to: Model.self) }
            .compactMap { $0 }
    }

    func save(_ model: Model) {
        guard let backModel = model.convert(to: BackType.self) else {
            return
        }
        dataService.update(object: backModel)
    }

    func save(_ models: [Model]) {
        models.forEach { save($0) }
    }

}
