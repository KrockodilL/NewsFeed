//
//  SettingsService.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import Foundation

final class SettingsService: SettingsServiceProtocol {

    @UserDefault(UserDefaultsKeys.usedSources.rawValue, defaultValue:Source.allCases.map { $0.rawValue })
    private var usedSources: [String]
    @UserDefault(UserDefaultsKeys.refreshPeriod.rawValue, defaultValue: 0)
    private var refreshPeriod: Int

    // MARK: - Sources
    func getSources() -> [Source] {
        return usedSources.map { Source(rawValue: $0) }.compactMap { $0 }
    }

    func update(_ source: Source) {
        if usedSources.firstIndex(where: { $0 == source.rawValue }) != nil {
            remove(source)
            return
        } else {
            append(source)
        }
    }

    private func append(_ source: Source) {
        guard usedSources.first(where: { $0 == source.rawValue }) == nil else {
            return
        }

        usedSources.append(source.rawValue)
    }

   private func remove(_ source: Source) {
        guard let index = usedSources.firstIndex(where: { $0 == source.rawValue }) else {
            return
        }

        usedSources.remove(at: index)
    }

    // MARK: - Period
    func getPeriod() -> Int {
        return refreshPeriod
    }

    func updatePeriod(with value: Int) {
        refreshPeriod = value
    }

}
