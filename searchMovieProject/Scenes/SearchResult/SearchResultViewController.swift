//
//  SearchResultViewController.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 23.06.2022.
//

import UIKit

class SearchResultViewController: BaseViewController {
    private lazy var searchTable: UITableView = {
        let table = UITableView()
        // table.register(ToDoTableViewCell.self, forCellReuseIdentifier: ToDoTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        designTable()
    }

    func designTable() {

        view.addSubview(searchTable)

        searchTable.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

}

extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .black
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click")
    }

}
