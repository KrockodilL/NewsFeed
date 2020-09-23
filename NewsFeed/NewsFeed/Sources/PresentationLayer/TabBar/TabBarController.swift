//
//  TabbarController.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import UIKit

final class TabBarController: UITabBarController {

    private let tabs: [TabBarItemStyle] = [.feed, .settings]

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = tabs.map { makeTab(for: $0) }
    }

    // MARK: - Private Methods
    private func makeTab(for style: TabBarItemStyle) -> UINavigationController {
        let viewController = style.viewController
        viewController.title = style.title
        let navCont = UINavigationController(rootViewController: viewController)
        let tabBarItem = UITabBarItem(title: style.title, image: style.image, selectedImage: style.image)
        navCont.tabBarItem = tabBarItem
        navCont.navigationBar.prefersLargeTitles = true
        return navCont
    }

}
