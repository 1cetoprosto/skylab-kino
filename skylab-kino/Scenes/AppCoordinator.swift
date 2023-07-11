//
//  AppCoordinator.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 10.07.2023.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    let window: UIWindow
    
    // MARK: - Coordinator
    
    init(window: UIWindow?) {
        guard let window = window else {
            fatalError("There is no window for AppCoordinator")
        }
        self.window = window
    }
   
    override func start() {
        window.makeKeyAndVisible()
        openMainTabBar()
    }
    
    func openMainTabBar() {
        let tabBarCoordinator = MainTabBarCoordinator(MainTabBarViewController())
        window.rootViewController = tabBarCoordinator.rootTabBarController
        tabBarCoordinator.start()
        addChildCoordinator(tabBarCoordinator)
    }
    
    override func finish() { }
}
