//
//  NewsTableCell.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import Foundation
import Kingfisher
import PinLayout

class NewsTableCell: UITableViewCell {

    // MARK: - Subviews
    private let containerView = ShadowContainerView()
    private let sourceLabel = PaddingLabel().with {
        $0.textInsets = UIEdgeInsets(top: Margin.x(1), left: Margin.x(2), bottom: Margin.x(1), right: Margin.x(2))
        $0.backgroundColor = R.color.sourceColor()
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
        $0.textColor = R.color.staticWhite()
    }
    private let dateLabel = PaddingLabel().with {
        $0.textInsets = UIEdgeInsets(top: Margin.x(1), left: Margin.x(2), bottom: Margin.x(1), right: Margin.x(2))
        $0.backgroundColor = R.color.sourceColor()
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
        $0.textColor = R.color.staticWhite()
    }
    private let titleLabel = UILabel().with {
        $0.numberOfLines = 2
        $0.backgroundColor = R.color.cellBackground()
    }
    private let newsImageView = UIImageView().with {
        $0.contentMode = .scaleAspectFit
    }
    private let descriptionLabel = UILabel().with {
        $0.numberOfLines = 0
        $0.backgroundColor = R.color.cellBackground()
    }
    private let wasSeenImageView = UIImageView().with {
        $0.image = UIImage(systemName: "checkmark.circle.fill")
        $0.tintColor = UIColor.systemGreen
    }

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configure()
        addSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        let imageViewSideLength: CGFloat = 10

        containerView.pin
            .top(Margin.x(2))
            .horizontally(Margin.x(4))

        titleLabel.pin
            .topLeft(Margin.x(4))
            .right(Margin.x(4))
            .sizeToFit(.width)

        newsImageView.pin
            .below(of: titleLabel)
            .marginTop(Margin.x(4))
            .horizontally()
            .aspectRatio(1.5)

        descriptionLabel.pin
            .horizontally(Margin.x(4))
            .below(of: newsImageView)
            .sizeToFit(.width)
            .marginTop(Margin.x(4))

        sourceLabel.pin
            .sizeToFit()
            .below(of: visible([descriptionLabel, newsImageView]), aligned: .right)
            .marginTop(Margin.x(4))
            .marginRight(Margin.x(4))

        dateLabel.pin
            .sizeToFit()
            .below(of: visible([descriptionLabel, newsImageView]), aligned: .left)
            .marginTop(Margin.x(4))
            .marginLeft(Margin.x(4))

        wasSeenImageView.pin
            .size(imageViewSideLength)
            .topRight(Margin.x(2))

        containerView.pin
            .height(sourceLabel.frame.maxY + Margin.x(4))

        contentView.pin.height(containerView.frame.maxY + Margin.x(4))
    }

    // MARK: - Public methods
    func setup(with model: NewsViewModel) {
        titleLabel.text = model.title
        sourceLabel.text = model.source
        newsImageView.kf.cancelDownloadTask()
        newsImageView.kf.setImage(with: URL(string: model.imageURL))
        descriptionLabel.text = model.description
        descriptionLabel.isHidden = model.isCollapsed
        dateLabel.isHidden = model.date == nil
        dateLabel.text = model.date
        wasSeenImageView.isHidden = !model.wasSeen

        contentView.setNeedsLayout()
    }

    // MARK: - Private methods
    private func addSubviews() {
        containerView.addSubviews([
            titleLabel,
            sourceLabel,
            newsImageView,
            descriptionLabel,
            dateLabel,
            wasSeenImageView
        ])
        contentView.addSubviews([
            containerView,
        ])
    }

    private func configure() {
        selectionStyle = .none
    }

}
