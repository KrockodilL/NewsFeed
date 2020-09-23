//
//  FeedContract.swift
//  NewsFeed
//
//  Created by Oleg Sinev on 12/09/2020.
//  Copyright © 2020 Indieos. All rights reserved.
//

// MARK: - Builder
protocol FeedBuilderProtocol: class {
	static func build() -> FeedViewController
}

// MARK: - View
protocol FeedViewInput: class {
    func hideErrorView()
    func showErrorView(with title: String)
    func setupTable(with models: [NewsViewModel])
    func startLoadingAnimation()
    func stopLoadingAnimation()
}
protocol FeedViewOutput {
    func viewDidLoad()
    func didSelectNews(with id: String)
}

// MARK: - Interactor
protocol FeedInteractorInput {
    func setNewsWasRead(with id: String)
    func getNews()
}
protocol FeedInteractorOutput: class {
    func newsFetched(_ news: [News])
    func networkErrorFetched(_ news: [News], error: Error)
}

// MARK: - Router
protocol FeedRouterInput {}
