//
//  FeedPresenter.swift
//  NewsFeed
//
//  Created by Oleg Sinev on 12/09/2020.
//  Copyright © 2020 Indieos. All rights reserved.
//

final class FeedPresenter {

    // MARK: - Protocol properties
    weak var view: FeedViewInput?
    private let interactor: FeedInteractorInput

    // MARK: - Init
    init(interactor: FeedInteractorInput) {
        self.interactor = interactor
    }

    private func processNetworkError(_ error: Error) {
        guard let error = error as? ServerError else {
            view?.showErrorView(with: R.string.localizable.displayCachedNews())
            return
        }
        if case let .invalidResponse(model) = error {
            if model.code == ServerError.parametersMissingCode {
                view?.showErrorView(with: R.string.localizable.noSources())
            }
        }

    }

}

// MARK: - FeedViewOutput
extension FeedPresenter: FeedViewOutput {

    func didSelectNews(with id: String) {
        interactor.setNewsWasRead(with: id)
    }

    func viewDidLoad() {
        view?.startLoadingAnimation()
        interactor.getNews()
    }

}

// MARK: - FeedInteractorOutput
extension FeedPresenter: FeedInteractorOutput {
    func networkErrorFetched(_ news: [News], error: Error) {
        processNetworkError(error)
        view?.stopLoadingAnimation()
        view?.setupTable(with: news.map { NewsViewModel(with: $0) })
    }


    func newsFetched(_ news: [News]) {
        view?.hideErrorView()
        view?.stopLoadingAnimation()
        view?.setupTable(with: news.map { NewsViewModel(with: $0) })
    }

}
