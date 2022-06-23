//
//  SearchResultTableViewCell.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 23.06.2022.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    static let identifier = "SearchResultTableViewCell"

    private let movieTitleLabel = UILabel.init(text: "",
                                               fontSize: 16,
                                               textColor: UIColor.setCellHeaderLabelColor)
    private let movieYearLabel = UILabel.init(text: "",
                                              fontSize: 12,
                                              textColor: UIColor.setCellContentLabelColor)
    private let movieImage = UIImageView.init(image: nil)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.setCellBackgroundColor
        contentView.addSubview(movieImage)
        contentView.addSubview(movieTitleLabel)
        contentView.addSubview(movieYearLabel)

        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.textAlignment = .center
        movieYearLabel.numberOfLines = 0
        movieYearLabel.textAlignment = .center

        movieTitleLabel.text = "Batman"
        movieYearLabel.text = "Yarasalar ile dolu bir hayat"
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        movieImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.width.height.equalTo(56)
        }
        movieTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(movieImage.snp_rightMargin).offset(24)
            make.right.equalToSuperview().inset(24)
            make.top.equalToSuperview().offset(24)
        }
        movieYearLabel.snp.makeConstraints { make in
            make.left.right.equalTo(movieTitleLabel)
            make.top.equalTo(movieTitleLabel.snp_bottomMargin).offset(16)
        }

    }
    required init?(coder: NSCoder) {
        fatalError()
    }

    func configure(model: Search) {
        movieTitleLabel.text = model.title
        movieYearLabel.text = model.year
    }
}
