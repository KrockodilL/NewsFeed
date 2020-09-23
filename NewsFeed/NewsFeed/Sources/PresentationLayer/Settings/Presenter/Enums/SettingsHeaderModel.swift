//
//  SettingsHeaderModel.swift
//  NewsFeed
//
//  Created by o.sinev on 16.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import UIKit

struct SettingsHeaderModel {

    let title: NSAttributedString

    init(with title: String) {
        self.title = title.addAttributes(weight: .semibold, size: 20, color: UIColor.label)
    }

}
