//
//  SourceViewModel.swift
//  NewsFeed
//
//  Created by o.sinev on 16.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import Foundation

final class SourceViewModel {

    let source: Source
    let title: String
    var isSelected = false

    init(with source: Source, isSelected: Bool) {
        self.source = source
        title = source.rawValue
        self.isSelected = isSelected
    }

}
