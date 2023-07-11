//
//  SearchCoordinator.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 11.07.2023.
//

import UIKit
import Swinject
import RxSwift

class SearchCoordinator: Coordinator {
    
    let rootController: UINavigationController
    
    init(_ rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    override func start() {
        openSearchController()
    }
    
    private func openSearchController() {
        
          let viewController = SearchViewController.instantiate(coordinator: self)
        viewController.searchHistoryViewModel = Container.searchHistoryViewModel.resolve(SearchHistoryViewModelType.self)

//        viewController.top5MoviesViewModel?.openQuizQuestionsController
//            .asObserver()
//            .subscribe(onNext: { [weak self] quizData in self?.openQuizQuestionsController(with: quizData) })
//            .disposed(by: bag)
        rootController.tabBarItem = UITabBarItem(title: TabBarItems.search.rawValue,
                                                 image: TabBarItems.search.image,
                                                 selectedImage: TabBarItems.search.selectedImage)
        //rootController.tabBarItem.setTitleText(font: AnonymousPro.bold(size: 10).font())
        rootController.pushViewController(viewController, animated: true)
    }
    
//    private func openQuizQuestionsController(with data: QuizTopicsModel) {
//        let coordinator = QuizQuestionsCoordinator(rootController)
//        coordinator.quizData = data
//        coordinator.start()
//    }
    
    
}
