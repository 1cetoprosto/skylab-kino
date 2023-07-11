//
//  HomeCoordinator.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 09.07.2023.
//

import UIKit
import Swinject
import RxSwift

class HomeCoordinator: Coordinator {
    
    let rootController: UINavigationController
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        openHomeController()
    }
    
    private func openHomeController() {
        
          let viewController = HomeViewController.instantiate(coordinator: self)
        viewController.top5MoviesViewModel = Container.top5Movies.resolve(Top5MoviesViewModelType.self)
        viewController.moviesViewModel = Container.movies.resolve(MoviesViewModelType.self)

//        viewController.top5MoviesViewModel?.openQuizQuestionsController
//            .asObserver()
//            .subscribe(onNext: { [weak self] quizData in self?.openQuizQuestionsController(with: quizData) })
//            .disposed(by: bag)
        rootController.tabBarItem = UITabBarItem(title: TabBarItems.home.rawValue,
                                                 image: TabBarItems.home.image,
                                                 selectedImage: TabBarItems.home.selectedImage)
        //rootController.tabBarItem.setTitleText(font: AnonymousPro.bold(size: 10).font())
        rootController.pushViewController(viewController, animated: true)
    }
    
//    private func openQuizQuestionsController(with data: QuizTopicsModel) {
//        let coordinator = QuizQuestionsCoordinator(rootController)
//        coordinator.quizData = data
//        coordinator.start()
//    }
    
    
}

