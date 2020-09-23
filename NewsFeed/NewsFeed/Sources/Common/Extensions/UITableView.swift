//
//  UITableView.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import Foundation
import UIKit.UITableView

extension UITableView {

    func cell<T: UITableViewCell>(at indexPath: IndexPath, for cellClass: T.Type) -> T {
        let reuseIdentifier = String(describing: cellClass)
        if let cell = self.dequeueReusableCell(withIdentifier: reuseIdentifier) as? T {
            return cell
        } else {
            register(cellClass, forCellReuseIdentifier: reuseIdentifier)
        }
        return cell(at: indexPath, for: cellClass)
    }

}
