//
//  SettingsPresenter.swift
//  NewsFeed
//
//  Created by Oleg Sinev on 12/09/2020.
//  Copyright © 2020 Indieos. All rights reserved.
//

class SettingsPresenter {

    // MARK: - Protocol properties
    weak var view: SettingsViewInput?
    private let interactor: SettingsInteractorInput

    // MARK: - Init
    init(interactor: SettingsInteractorInput) {
        self.interactor = interactor
    }

    private func makeSectionModels() -> [SettingsSectionModel] {
        return [makeSourcesModel(), makeIntervalModel()]
    }

    private func makeSourcesModel() -> SettingsSectionModel {
        // TODO: - Localizable
        let usedSources = interactor.getSources()
        return SettingsSectionModel(type: .source,
                                    header: SettingsHeaderModel(with: R.string.localizable.sources()),
                                     models: Source.allCases.map { SourceViewModel(with: $0, isSelected: usedSources.contains($0)) })
    }

    private func makeIntervalModel() -> SettingsSectionModel {
        return SettingsSectionModel(type: .period, header: SettingsHeaderModel(with: R.string.localizable.updatePeriod()),
                                    models: [PeriodViewModel(with: interactor.getPeriod())])
    }
}

// MARK: - SettingsViewOutput
extension SettingsPresenter: SettingsViewOutput {

    func didChangeSlider(_ value: Float) {
        interactor.updatePeriod(with: Int(value))

        view?.setupTableView(with: makeSectionModels())
    }

    func didSelect(_ source: Source) {
        interactor.update(source)
    }

    func viewDidLoad() {
        view?.setupTableView(with: makeSectionModels())
    }

}

// MARK: - SettingsInteractorOutput
extension SettingsPresenter: SettingsInteractorOutput {}
