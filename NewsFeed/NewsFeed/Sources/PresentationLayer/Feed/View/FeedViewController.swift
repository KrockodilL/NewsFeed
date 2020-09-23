//
//  FeedViewController.swift
//  NewsFeed
//
//  Created by Oleg Sinev on 12/09/2020.
//  Copyright © 2020 Indieos. All rights reserved.
//

import PinLayout

class FeedViewController: BaseViewController {

    // MARK: - Subviews
    private let errorView = ErrorView().with {
        $0.isHidden = true
    }
    private lazy var tableView = UITableView().with {
        $0.delegate = self
        $0.dataSource = self
        $0.tableFooterView = UIView()
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        $0.rowHeight = UITableView.automaticDimension
    }
    // MARK: - Protocol Properties
    private let output: FeedViewOutput

    // MARK: - Properties
    private var viewModels = [NewsViewModel]()

    // MARK: - Init
    init(output: FeedViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life cycle
    override func loadView() {
        super.loadView()

        addSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        output.viewDidLoad()
    }

    // MARK: Layout
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        layout()
    }

    private func layout() {
        let errorViewHeight: CGFloat = 60

        tableView.pin.all()

        errorView.pin
            .horizontally()
            .height(errorViewHeight)
            .top()
    }

    // MARK: Private methods
    private func configure() {
        title = R.string.localizable.feed()
        view.backgroundColor = R.color.backgroundColor()
    }

    private func addSubviews() {
        view.addSubviews([
            tableView,
            errorView
        ])
        setupActivityIndicator()
    }

}

// MARK: - FeedViewInput
extension FeedViewController: FeedViewInput {

    func showErrorView(with title: String) {
        errorView.setup(with: title)
        errorView.isHidden = false
    }

    func hideErrorView() {
        errorView.isHidden = true
    }

    func setupTable(with models: [NewsViewModel]) {
        self.viewModels = models
        tableView.reloadData()
    }

}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.cell(at: indexPath, for: NewsTableCell.self)
        cell.setup(with: viewModels[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModels[indexPath.row].isCollapsed = !viewModels[indexPath.row].isCollapsed
        viewModels[indexPath.row].wasSeen = true
        output.didSelectNews(with: viewModels[indexPath.row].id)
        tableView.reloadData()
    }

}
