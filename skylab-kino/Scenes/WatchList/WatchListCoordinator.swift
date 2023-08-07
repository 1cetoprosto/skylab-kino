//
//  WatchListCoordinator.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 11.07.2023.
//

import UIKit
import Swinject
import RxSwift

class WatchListCoordinator: Coordinator {
    
    let rootController: UINavigationController
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        openWatchListController()
    }
    
    private func openWatchListController() {
        
          let viewController = WatchListViewController.instantiate(coordinator: self)
        viewController.viewModel = Container.watchListViewModel.resolve(MovieListViewModelType.self)

//        viewController.top5MoviesViewModel?.openQuizQuestionsController
//            .asObserver()
//            .subscribe(onNext: { [weak self] quizData in self?.openQuizQuestionsController(with: quizData) })
//            .disposed(by: bag)
        rootController.tabBarItem = UITabBarItem(title: TabBarItems.watchList.rawValue,
                                                 image: TabBarItems.watchList.image,
                                                 selectedImage: TabBarItems.watchList.selectedImage)
        //rootController.tabBarItem.setTitleText(font: AnonymousPro.bold(size: 10).font())
        rootController.pushViewController(viewController, animated: true)
    }
    
//    private func openQuizQuestionsController(with data: QuizTopicsModel) {
//        let coordinator = QuizQuestionsCoordinator(rootController)
//        coordinator.quizData = data
//        coordinator.start()
//    }
    
    
}
