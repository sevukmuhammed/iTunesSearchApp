//
//  SearchPageCoordinator.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 26.01.2021.
//

import Foundation
import Swinject
import RxSwift

public enum SearchPageScene: String, AppScene {
    
    case searchPage = "searchPage"
    
    public var identifier: String {
        return "SearchPage"
    }
    
    public var name: String {
        return self.rawValue
    }
    
    public var coordinator: BaseCoordinator.Type {
        return SearchPageCoordinator.self
    }
}

final class SearchPageCoordinator: BaseCoordinator {
    override func start(_ scene: AppScene, data: Any) {
        viewController = container.resolveViewController(SearchPageViewController.self)
        navigationController.pushViewController(viewController, animated: true)
    }
}
