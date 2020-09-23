//
//  SettingsContract.swift
//  NewsFeed
//
//  Created by Oleg Sinev on 12/09/2020.
//  Copyright © 2020 Indieos. All rights reserved.
//

// MARK: - Builder
protocol SettingsBuilderProtocol: class {
	static func build() -> SettingsViewController
}

// MARK: - View
protocol SettingsViewInput: class {
    func setupTableView(with models: [SettingsSectionModel])
}
protocol SettingsViewOutput {
    func viewDidLoad()
    func didSelect(_ source: Source)
    func didChangeSlider(_ value: Float)
}

// MARK: - Interactor
protocol SettingsInteractorInput {
    func updatePeriod(with value: Int)
    func getPeriod() -> Int
    func update(_ source: Source)
    func getSources() -> [Source]
}
protocol SettingsInteractorOutput: class {}

// MARK: - Router
protocol SettingsRouterInput {}
