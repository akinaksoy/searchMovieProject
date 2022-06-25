//
//  SearchResultViewController.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 23.06.2022.
//

import UIKit
import Hero
class SearchResultViewController: BaseViewController {

    let viewModel = SearchViewModel()
    var searchBar: UISearchBar?

    private lazy var searchTable: UITableView = {
        let table = UITableView()
        table.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    private var searchButton: UIButton = .init(buttonText: "Search")

    @objc func clickedOnSearch() {
        designTable()
        prepareMovieListForTable()
        searchBar?.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        enableHero()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        disableHero()
    }

    override func setup() {
        super.setup()

        configureNavigationBar()

    }
    override func configureNavigationBar() {
        super.configureNavigationBar()
    }

    func prepareMovieListForTable() {

        guard let movieName = searchBar?.text else {return}

        viewModel.prepareMovieListForTable(movieTitle: movieName) { result in
            switch result {
            case .success(true) :
                self.updateTable()
            case .failure :
                self.showNetworkError()
            case .success(false):
                self.showNetworkError()
            }
        }
    }
    func setEnableSearchButton() {
        searchTable.removeFromSuperview()
        searchButton.addTarget(self, action: #selector(clickedOnSearch), for: .touchUpInside)
        view.addSubview(searchButton)
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }
    func designTable() {
        searchButton.removeFromSuperview()
        view.addSubview(searchTable)
        searchTable.separatorColor = UIColor.setCellHeaderLabelColor

        searchTable.snp.makeConstraints { make in
            make.top.left.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }

        updateTable()
    }
    func updateTable() {
        DispatchQueue.main.async { [weak self] in
            self?.searchTable.reloadData()
        }
    }
}
