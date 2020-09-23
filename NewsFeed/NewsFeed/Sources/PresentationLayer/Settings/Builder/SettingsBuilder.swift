//
//  SettingsBuilder.swift
//  NewsFeed
//
//  Created by Oleg Sinev on 12/09/2020.
//  Copyright © 2020 Indieos. All rights reserved.
//

final class SettingsBuilder: SettingsBuilderProtocol {

    static func build() -> SettingsViewController {
        let router = SettingsRouter()
        let interactor = SettingsInteractor(with: DIContainer.settingsService,
                                            subscriptionManager: DIContainer.subscriptionManager)
        let presenter = SettingsPresenter(interactor: interactor)
        let viewController = SettingsViewController(output: presenter)

        router.view = viewController
        presenter.view = viewController
        interactor.output = presenter

        return viewController
    }

}
