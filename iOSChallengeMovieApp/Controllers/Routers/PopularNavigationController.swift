//
//  PopularNavigationVC.swift
//  iOSChallengeMovieApp
//
//  Created by Muhammed Emin Aydın on 2.06.2021.
//

import UIKit

class PopularNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let popularMovieVC = PopularMovieViewController()
        popularMovieVC.title = "popularMovieVC"
        popularMovieVC.tabBarItem.image = UIImage(systemName: "film")
        self.viewControllers = [popularMovieVC]
        
    }
}
