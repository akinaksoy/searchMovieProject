//
//  SearchResultViewController.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 23.06.2022.
//

import UIKit

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

        searchTable.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func updateTable() {

        DispatchQueue.main.async { [weak self] in
            self?.searchTable.reloadData()
        }
    }
}

extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath) as? SearchResultTableViewCell else {
            return UITableViewCell()
        }
        let searchModel = searchResultList[indexPath.row]
        cell.configure(model: searchModel)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click")
    }

}
