//
//  MovieDetailViewController.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 24.06.2022.
//

import UIKit
import Kingfisher

class MovieDetailViewController: BaseViewController {

    private let movieImage = UIImageView.init(image: nil)
    private let movieNameLabel = UILabel.init(text: "a", fontSize: 16, textColor: UIColor.setContentColor)
    private let movieYearArea = UIStackView.init(axis: .vertical, distribution: .fillEqually, allignment: .center)
    private let movieYearLabel = UILabel.init(text: "a", fontSize: 14, textColor: UIColor.setCellHeaderLabelColor)
    private let movieYearValueLabel = UILabel.init(text: "a", fontSize: 14, textColor: UIColor.setCellContentLabelColor)
    private let runTimeArea = UIStackView.init(axis: .vertical, distribution: .fillEqually, allignment: .center)
    private let runTimeLabel = UILabel.init(text: "a", fontSize: 14, textColor: UIColor.setCellHeaderLabelColor)
    private let runTimeValueLabel = UILabel.init(text: "a", fontSize: 14, textColor: UIColor.setCellContentLabelColor)
    private let genreArea = UIStackView.init(axis: .vertical, distribution: .fillEqually, allignment: .center)
    private let genreLabel = UILabel.init(text: "a", fontSize: 14, textColor: UIColor.setCellHeaderLabelColor)
    private let genreValueLabel = UILabel.init(text: "a", fontSize: 14, textColor: UIColor.setCellContentLabelColor)
    private let directorArea = UIStackView.init(axis: .vertical, distribution: .fillEqually, allignment: .center)
    private let directorLabel = UILabel.init(text: "a", fontSize: 14, textColor: UIColor.setCellHeaderLabelColor)
    private let directorValueLabel = UILabel.init(text: "a", fontSize: 14, textColor: UIColor.setCellContentLabelColor)
    private let actorsArea = UIStackView.init(axis: .vertical, distribution: .fillEqually, allignment: .center)
    private let actorsLabel = UILabel.init(text: "a", fontSize: 14, textColor: UIColor.setCellHeaderLabelColor)
    private let actorsValueLabel = UILabel.init(text: "a", fontSize: 14, textColor: UIColor.setCellContentLabelColor)
    private let summaryLabel = UILabel.init(text: "a", fontSize: 18, textColor: UIColor.setCellHeaderLabelColor)
    private let summaryValueLabel = UILabel.init(text: "a", fontSize: 14, textColor: UIColor.setCellContentLabelColor)
    private let movieHeaderArea = UIStackView.init(axis: .horizontal, distribution: .fillEqually, allignment: .center)
    private let movieDetailArea = UIStackView.init(axis: .vertical, distribution: .fillEqually, allignment: .center)
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func setup() {
        super.setup()

        view.addSubview(movieHeaderArea)
        movieHeaderArea.addArrangedSubview(movieImage)
        movieHeaderArea.addArrangedSubview(movieDetailArea)
        movieDetailArea.addArrangedSubview(movieYearArea)
        movieYearArea.addArrangedSubview(movieYearLabel)
        movieYearArea.addArrangedSubview(movieYearValueLabel)
        movieDetailArea.addArrangedSubview(runTimeArea)
        runTimeArea.addArrangedSubview(runTimeLabel)
        runTimeArea.addArrangedSubview(runTimeValueLabel)
        movieDetailArea.addArrangedSubview(genreArea)
        genreArea.addArrangedSubview(genreLabel)
        genreArea.addArrangedSubview(genreValueLabel)
        movieDetailArea.addArrangedSubview(directorArea)
        directorArea.addArrangedSubview(directorLabel)
        directorArea.addArrangedSubview(directorValueLabel)
        movieDetailArea.addArrangedSubview(actorsArea)
        actorsArea.addArrangedSubview(actorsLabel)
        actorsArea.addArrangedSubview(actorsValueLabel)
        view.addSubview(summaryLabel)
        view.addSubview(summaryValueLabel)

        configureNavigationBar()
        makeConstraints()
        makeDesign()
    }

    func makeDesign() {
        movieNameLabel.textAlignment = .center
        view.backgroundColor = UIColor.setCellBackgroundColor
    }

    override func configureNavigationBar() {
        super.configureNavigationBar()
    }
    func makeConstraints() {

        movieHeaderArea.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(movieImage.snp_rightMargin)
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.50)
        }
        movieImage.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(2)
        }
        movieYearArea.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        runTimeArea.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        genreArea.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        directorArea.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        actorsArea.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        summaryLabel.snp.makeConstraints { make in
            make.top.equalTo(movieHeaderArea.snp_bottomMargin)
            make.left.right.equalToSuperview()
        }
        summaryValueLabel.snp.makeConstraints { make in
            make.top.equalTo(summaryLabel.snp_bottomMargin)
            make.left.right.bottom.equalToSuperview()
        }
    }
    func configure(model: MovieDetail) {
        title = model.title
        DispatchQueue.main.async {
            let imageURL = URL.init(string: model.poster)
            KF.url(imageURL).set(to: self.movieImage )
            self.movieYearLabel.text = "Year"
            self.movieYearValueLabel.text = model.year
            self.runTimeLabel.text = "Runtime"
            self.runTimeValueLabel.text = model.runtime
            self.genreLabel.text = "Genre"
            self.genreValueLabel.text = model.genre
            self.directorLabel.text = "Director"
            self.directorValueLabel.text = model.director
            self.actorsLabel.text = "Actors"
            self.actorsValueLabel.text = model.actors
            self.summaryLabel.text = "SUMMARY"
            self.summaryValueLabel.text = model.plot
        }

    }
}
