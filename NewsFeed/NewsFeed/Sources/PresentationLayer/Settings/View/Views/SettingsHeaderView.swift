//
//  SettingsHeaderView.swift
//  NewsFeed
//
//  Created by o.sinev on 16.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import PinLayout

final class SettingsHeaderView: UIView {

    // MARK: - Subviews
    private let titleLabel = UILabel()

    // MARK: - Init
    init(with model: SettingsHeaderModel?) {
        super.init(frame: .zero)

        configure()
        titleLabel.attributedText = model?.title
        addSubview(titleLabel)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()

        layout()
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)

        return frame.size
    }

    private func layout() {
        titleLabel.pin
            .vCenter()
            .horizontally(Margin.x(4))
            .sizeToFit(.width)
    }

    // MARK: - Private methods
    private func configure() {
        backgroundColor = R.color.backgroundColor()
    }

}
