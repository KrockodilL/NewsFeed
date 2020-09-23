//
//  SettingsInteractor.swift
//  NewsFeed
//
//  Created by Oleg Sinev on 12/09/2020.
//  Copyright © 2020 Indieos. All rights reserved.
//

class SettingsInteractor {

    // MARK: - Protocol properties
    weak var output: SettingsInteractorOutput?
    private let settingsService: SettingsServiceProtocol
    private let subscriptionManager: GlobalSubscriptionManagerProtocol

    init(with settingsService: SettingsServiceProtocol, subscriptionManager: GlobalSubscriptionManagerProtocol) {
        self.settingsService = settingsService
        self.subscriptionManager = subscriptionManager
    }

}

// MARK: - SettingsInteractorInput
extension SettingsInteractor: SettingsInteractorInput {

    func updatePeriod(with value: Int) {
        settingsService.updatePeriod(with: value)
        subscriptionManager.didUpdateRefreshPeriod()
    }

    func getPeriod() -> Int {
        settingsService.getPeriod()
    }

    func getSources() -> [Source] {
        return settingsService.getSources()
    }

    func update(_ source: Source) {
        settingsService.update(source)
        subscriptionManager.didUpdateSourceList()
    }

}
