//
//  AppCoordinator.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 26.01.2021.
//

import UIKit
import os.log
import Swinject
import RxSwift

enum AppMainScene: String, AppScene {
    
    case app = "app"
    case back = "back"
    
    var identifier: String {
        return "AppMain"
    }
    
    var name: String {
        return self.rawValue
    }
    
    var coordinator: BaseCoordinator.Type {
        return BaseCoordinator.self
    }
    
}

final class AppCoordinator: CoordinatorProtocol {
    private let window: UIWindow
    let container: Container
    private let disposeBag: DisposeBag = DisposeBag()
    
    init(window: UIWindow, container: Container) {
        self.window = window
        self.container = container
        NavigationService.initializeNavigationService(container, disposeBag: disposeBag, fromViewController: nil)
    }
    
    func navigate(scene: AppScene, data: Any) {
        
    }
    
    func back(_ viewController: UIViewController) {
        
    }
    
    func start(_ scene: AppScene, data: Any) {
        
        let searchViewController = container.resolveViewController(SearchPageViewController.self)
        let navigationController = BaseNavigationController(rootViewController: searchViewController)
        navigationController.navigationBar.tintColor = .black
        self.window.rootViewController = navigationController
    
        
        searchViewController.navigationSubject.subscribe(onNext: { navigation in
            let searchPageCoordinator = SearchPageCoordinator(container: self.container,
                                                              navigationController: navigationController,
                                                              disposeBag: self.disposeBag,
                                                              fromViewController: nil)
            
            try! NavigationService
                .requestNavigationObject()
                .start(fromViewController: searchViewController, navigationController: navigationController, prevCoordinator: searchPageCoordinator, nextScene: navigation.scene, data: navigation.data, animation: true)
            
        }).disposed(by: disposeBag)
    }
}
