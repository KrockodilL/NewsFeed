//
//  ErrorView.swift
//  NewsFeed
//
//  Created by o.sinev on 21.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import Foundation
import PinLayout

class ErrorView: UIView {

    // MARK: - Subviews
    private let errorLabel = UILabel().with {
        $0.textAlignment = .center
    }
    // MARK: - Protocol properties
    // MARK: - Properties
    // MARK: - Observable properties

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews()
        configure()
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
        pin.width(size.width)
        layout()
        return CGSize(width: frame.width, height: frame.height)
    }

    private func layout() {
        errorLabel.pin
            .horizontally()
            .bottom()
            .sizeToFit(.width)
    }

    // MARK: - Public methods
    func setup(with text: String) {
        errorLabel.text = text
        setNeedsLayout()
    }

    // MARK: - Private methods
    private func addSubviews() {
        addSubview(errorLabel)
    }

    private func configure() {
        backgroundColor = .red
    }

}

