//
//  IntervalTableCell.swift
//  NewsFeed
//
//  Created by o.sinev on 20.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import Foundation
import PinLayout
import RxSwift

final class PeriodTableCell: UITableViewCell {

    // MARK: - Subviews
    private let slider = UISlider().with {
        $0.minimumValue = 0
        $0.maximumValue = 60
        $0.isContinuous = false
    }
    private let valueLabel = UILabel()

    // MARK: - Properties
    var reuseBag = DisposeBag()

    // MARK: - Observable properties
    var didChangeSliderValue: Observable<Float> {
        slider.rx.value.asObservable()
    }

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        reuseBag = DisposeBag()
    }

    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()

        layout()
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        layout()
        return contentView.frame.size
    }

    private func layout() {
        valueLabel.pin
            .sizeToFit()
            .topLeft(Margin.x(2))

        slider.pin
            .below(of: valueLabel)
            .horizontally(Margin.x(2))
            .sizeToFit(.width)

        contentView.pin.height(slider.frame.maxY + Margin.x(2))
    }

    // MARK: - Public methods
    func setup(with model: PeriodViewModel) {
        valueLabel.text = model.text
        slider.value = Float(model.currentValue)
    }

    // MARK: - Private methods
    private func addSubviews() {
        contentView.addSubviews([slider,
                                 valueLabel])
    }

}
