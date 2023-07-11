//
//  MainTabBarCoordinator.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 09.07.2023.
//

import UIKit

class MainTabBarCoordinator: Coordinator {
    
    let rootTabBarController: UITabBarController
    
    init(_ rootTabBarController: UITabBarController) {
        self.rootTabBarController = rootTabBarController
    }
    
    override func start() {
        addHomePage()
        addSearchPage()
        //addWatchListPage()
    }
    
    func addHomePage() {
        let coordinator = HomeCoordinator(UINavigationController())
        rootTabBarController.viewControllers?.append(coordinator.rootController)
        addChildCoordinator(coordinator)
        coordinator.start()
    }
    
    func addSearchPage() {
        let coordinator = SearchCoordinator(UINavigationController())
        rootTabBarController.viewControllers?.append(coordinator.rootController)
        addChildCoordinator(coordinator)
        coordinator.start()
    }
    
    //    func addWatchListPage() {
    //        let coordinator = WatchListCordinator(UINavigationController())
    //        rootTabBarController.viewControllers?.append(coordinator.rootController)
    //        addChildCoordinator(coordinator)
    //        coordinator.start()
    //    }
    
}

