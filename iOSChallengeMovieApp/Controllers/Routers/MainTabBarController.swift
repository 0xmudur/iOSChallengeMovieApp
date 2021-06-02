//
//  MainTabBarController.swift
//  iOSChallengeMovieApp
//
//  Created by Muhammed Emin Aydın on 2.06.2021.
//

import UIKit

class MainTabBarController: UITabBarController {


    override func viewDidLoad() {
        super.viewDidLoad()
      
        let popularNavigationController = PopularNavigationController()
        let searchNavigationController = SearchNavigationController()
        self.viewControllers = [popularNavigationController, searchNavigationController]
    }
    
}
