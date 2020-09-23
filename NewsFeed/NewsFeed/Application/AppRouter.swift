//
//  AppRouter.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import UIKit

final class AppRouter {

    private let window: UIWindow?
    private var tabBar: TabBarController?

    init(with window: UIWindow?) {
        self.window = window
    }

    func start() {
        tabBar = TabBarController()
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }
}
