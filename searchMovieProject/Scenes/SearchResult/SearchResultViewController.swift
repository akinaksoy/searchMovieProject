//
//  SearchResultViewController.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 23.06.2022.
//

import UIKit
import Hero
class SearchResultViewController: BaseViewController {
    var searchResultList: [Search] = [Search]()
    private lazy var searchTable: UITableView = {
        let table = UITableView()
        table.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        return table
    }()
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
        designTable()
        configureNavigationBar()

    }
    override func configureNavigationBar() {
        super.configureNavigationBar()
    }

    func designTable() {

        view.addSubview(searchTable)
        searchTable.separatorColor = UIColor.setCellHeaderLabelColor
        searchTable.snp.makeConstraints { make in
            make.top.left.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
    }
    func updateTable() {

        DispatchQueue.main.async { [weak self] in
            self?.searchTable.reloadData()
        }
    }
}
