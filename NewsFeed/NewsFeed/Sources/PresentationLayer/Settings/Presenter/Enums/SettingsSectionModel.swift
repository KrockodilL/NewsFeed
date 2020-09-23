//
//  SettingsCellType.swift
//  NewsFeed
//
//  Created by o.sinev on 16.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import Foundation

enum SettingsCellType {
    case source
    case period
}

struct SettingsSectionModel {

    let type: SettingsCellType
    let header: SettingsHeaderModel?
    let models: [Any]

}
