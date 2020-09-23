//
//  SettingsServiceProtocol.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import Foundation

protocol SettingsServiceProtocol {

    func getSources() -> [Source]
    func update(_ source: Source)

    func getPeriod() -> Int
    func updatePeriod(with value: Int)

}
