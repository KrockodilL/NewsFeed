//
//  BaseViewController.swift
//  NewsFeed
//
//  Created by o.sinev on 20.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - Subviews
    private var activityIndicator: UIActivityIndicatorView?

    // MARK: - Life Cycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        activityIndicator?.pin.center(to: view.anchor.center)
    }

    // MARK: - Activity Indicator
    final func setupActivityIndicator() {
        guard activityIndicator == nil else {
            return
        }

        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        self.activityIndicator = activityIndicator
    }

    final func startLoadingAnimation() {
        DispatchQueue.main.async {
            self.activityIndicator?.startAnimating()
        }
    }

    final func stopLoadingAnimation() {
        DispatchQueue.main.async {
            self.activityIndicator?.stopAnimating()
        }
    }

}
