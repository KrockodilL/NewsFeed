//
//  GlobalSubscriptionManagerProtocol.swift
//  NewsFeed
//
//  Created by o.sinev on 20.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import RxSwift

protocol GlobalSubscriptionManagerProtocol {

    var updatedPeriodObservable: Observable<Void> { get }
    var updatedSourceObservable: Observable<Void> { get }

    func didUpdateSourceList()

    func didUpdateRefreshPeriod()

}
