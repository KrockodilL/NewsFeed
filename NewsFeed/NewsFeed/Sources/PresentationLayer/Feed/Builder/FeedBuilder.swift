//
//  FeedBuilder.swift
//  NewsFeed
//
//  Created by Oleg Sinev on 12/09/2020.
//  Copyright © 2020 Indieos. All rights reserved.
//

final class FeedBuilder: FeedBuilderProtocol {

    static func build() -> FeedViewController {
        let router = FeedRouter()
        let interactor = FeedInteractor(with: DIContainer.feedService, settingsService: DIContainer.settingsService,
                                        subscriptionManager: DIContainer.subscriptionManager)
        let presenter = FeedPresenter(interactor: interactor)
        let viewController = FeedViewController(output: presenter)

        router.view = viewController
        presenter.view = viewController
        interactor.output = presenter

        return viewController
    }

}
