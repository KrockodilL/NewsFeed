//
//  IntervalViewModel.swift
//  NewsFeed
//
//  Created by o.sinev on 20.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import Foundation

final class PeriodViewModel {

    let currentValue: Int
    let text: String

    init(with currentValue: Int) {
        self.currentValue = currentValue
        self.text = "\(currentValue)"
    }

}
