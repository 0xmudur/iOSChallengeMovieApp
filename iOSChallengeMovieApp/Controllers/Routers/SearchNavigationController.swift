//
//  SearchNavigationController.swift
//  iOSChallengeMovieApp
//
//  Created by Muhammed Emin Aydın on 2.06.2021.
//

import UIKit

class SearchNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchMovieVC = MovieSearchViewController()
        searchMovieVC.title = "searchMovieVC"
        searchMovieVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        self.viewControllers = [searchMovieVC]
        
    }

}
