//
//  MainTabBarViewController.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 09.07.2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        self.viewControllers = [UIViewController()]
        self.viewControllers = []

        tabBar.tintColor = UIColor.Main.black
        tabBar.unselectedItemTintColor = UIColor.Main.black
    }
}

enum TabBarItems: String {
    case home, search, watchList
    var image: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "home")
        case .search:
            return UIImage(named: "search")
        case .watchList:
            return UIImage(named: "watchList")
        }
    }
    var selectedImage: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "home.selected")
        case .search:
            return UIImage(named: "search.selected")
        case .watchList:
            return UIImage(named: "watchList.selected")
        }
    }
}

