//
//  TabBarItemStyle.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import UIKit

enum TabBarItemStyle {
    case feed
    case settings
}

extension TabBarItemStyle {

    var image: UIImage? {
        switch self {
        case .feed:
            return UIImage(systemName: "doc.plaintext")
        case .settings:
            return UIImage(systemName: "gear")
        }
    }

    var title: String? {
        switch self {
        case .feed:
            return R.string.localizable.feed()
        case .settings:
            return R.string.localizable.settings()
        }
    }

    var viewController: UIViewController {
        switch self {
        case .feed:
            return FeedBuilder.build()
        case .settings:
            return SettingsBuilder.build()
        }
    }

}
