//
//  MovieDetailViewController.swift
//  searchMovieProject
//
//  Created by Akın Aksoy on 24.06.2022.
//

import UIKit

class MovieDetailViewController: UIViewController {

    private let movieImage = UIImageView.init(image: nil)
    private let movieNameLabel = UILabel.init(text: "", fontSize: 16, textColor: UIColor.setContentColor)
    private let movieYearLabel = UILabel.init(text: "", fontSize: 14, textColor: UIColor.setContentColor)
    private let runTimeLabel = UILabel.init(text: "", fontSize: 14, textColor: UIColor.setContentColor)
    private let genreLabel = UILabel.init(text: "", fontSize: 14, textColor: UIColor.setContentColor)
    private let directorLabel = UILabel.init(text: "", fontSize: 14, textColor: UIColor.setContentColor)
    private let actorsLabel = UILabel.init(text: "", fontSize: 14, textColor: UIColor.setContentColor)
    private let summaryLabel = UILabel.init(text: "", fontSize: 14, textColor: UIColor.setContentColor)

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
