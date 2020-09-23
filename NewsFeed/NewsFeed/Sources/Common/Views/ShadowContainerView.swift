//
//  ContainerView.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import Foundation
import PinLayout

final class ShadowContainerView: UIView {

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        addShadow(shouldSetPath: true, radius: 4,
                  opacity: 0.3, offset: CGSize(width: 0, height: 0))
    }

    // MARK: - Private methods
    private func configure() {
        backgroundColor = R.color.cellBackground()
    }

}
