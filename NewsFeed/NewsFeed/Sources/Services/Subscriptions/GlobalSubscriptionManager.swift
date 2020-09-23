//
//  GlobalSubscriptionManager.swift
//  NewsFeed
//
//  Created by o.sinev on 17.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import RxSwift

final class GlobalSubscriptionManager: GlobalSubscriptionManagerProtocol {

    static let shared = GlobalSubscriptionManager()

    private init() {}

    // MARK: - Properties
    private let updatedPeriodSubject = PublishSubject<Void>()

    var updatedPeriodObservable: Observable<Void> {
        updatedPeriodSubject.asObservable()
    }

    private let updatedSourceSubject = PublishSubject<Void>()

    var updatedSourceObservable: Observable<Void> {
        updatedSourceSubject.asObservable()
    }

    func didUpdateSourceList() {
        updatedSourceSubject.onNext(())
    }

    func didUpdateRefreshPeriod() {
        updatedPeriodSubject.onNext(())
    }

}
