//
//  FeedInteractor.swift
//  NewsFeed
//
//  Created by Oleg Sinev on 12/09/2020.
//  Copyright © 2020 Indieos. All rights reserved.
//

import RxSwift
import LeakDetector

class FeedInteractor {

    // MARK: - Protocol properties
    weak var output: FeedInteractorOutput?
    private let feedService: FeedServiceProtocol
    private let settingsService: SettingsServiceProtocol
    private let subscriptionManager: GlobalSubscriptionManagerProtocol

    // MARK: - Properties
    private let disposeBag = DisposeBag()
    private var timerObservable: Disposable?

    init(with feedService: FeedServiceProtocol,
         settingsService: SettingsServiceProtocol,
         subscriptionManager: GlobalSubscriptionManagerProtocol) {
        self.feedService = feedService
        self.subscriptionManager = subscriptionManager
        self.settingsService = settingsService
        restartTimer(with: settingsService.getPeriod())
        bindObservables()
    }

    private func bindObservables() {
        subscriptionManager.updatedSourceObservable.subscribe(onNext: { [unowned self] in
            self.getNewsFeed()
        }).disposed(by: disposeBag)

        subscriptionManager.updatedPeriodObservable.subscribe(onNext: { [unowned self] in
            self.restartTimer(with: settingsService.getPeriod())
        }).disposed(by: disposeBag)
    }

    private func getNewsFeed() {
        let currentSources = settingsService.getSources()
        feedService.getNewsFeed(for: settingsService.getSources())
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [unowned self] in
                let seenNews = self.feedService.getAllSeenNews()
                var networkNews = FeedMapper.convertNetwork($0.articles)
                seenNews.forEach { seen in
                    if let index = networkNews.firstIndex(where: { $0.id == seen.id }) {
                        networkNews[index].wasSeen = true
                    }
                }
                self.feedService.save(networkNews)
                self.output?.newsFetched(networkNews)
            }, onError: { [unowned self] in
                self.output?.networkErrorFetched(self.feedService.getNewsFeedFromCache(with: currentSources), error: $0)
            }).disposed(by: disposeBag)
    }

    private func restartTimer(with period: Int) {
        if let timer = timerObservable {
            timer.dispose()
        }
        if period != 0 {
            let intervalInMinutes = period * 60
            timerObservable = Observable<Int>
                .interval(RxTimeInterval.seconds(intervalInMinutes), scheduler: MainScheduler.instance)
                .subscribe(onNext: { [unowned self] _ in
                    self.getNewsFeed()
                })
        }
    }

}

// MARK: - FeedInteractorInput
extension FeedInteractor: FeedInteractorInput {

    func getNews() {
        getNewsFeed()
    }

    func setNewsWasRead(with id: String) {
        feedService.setNewsWasRead(with: id)
    }

}
