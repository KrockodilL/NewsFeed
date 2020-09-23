//
//  NSAttributedString.swift
//  NewsFeed
//
//  Created by o.sinev on 16.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import UIKit

extension String {

    func addAttributes(weight: UIFont.Weight, size: CGFloat, color: UIColor, kern: Double = 0) -> NSAttributedString {
        return NSAttributedString(string: self, attributes: attributes(weight: weight, size: size, color: color, kern: kern))
    }

    private func attributes(weight: UIFont.Weight,
                            size: CGFloat, color: UIColor, kern: Double = 0) -> [NSAttributedString.Key: Any] {
        return [
            .font: UIFont.systemFont(ofSize: size, weight: weight),
            .foregroundColor: color,
            .kern: kern,
        ]
    }

}
