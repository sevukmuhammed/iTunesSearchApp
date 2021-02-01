//
//  DetailPageCoordinator.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 30.01.2021.
//

import Swinject
import UIKit
import RxSwift

public enum DetailPageTypes {
    case MovieDetail
    case SongDetail
    case SoftwareDetail
    case BookDetail
}

public enum DetailScene:String, AppScene {
    
    case back = "back"
    case detail = "detail"
    
    public var name: String {
        return self.rawValue
    }
    
    public var identifier: String {
        return "Detail"
    }
        
    public var coordinator: BaseCoordinator.Type{
        return DetailPageCoordinator.self
    }
}

final class DetailPageCoordinator:  BaseCoordinator {
    
    override func start(_ name:AppScene, data:Any) {
        viewController = container.resolveViewController(DetailPageViewController.self)
        let _data = data as! [String:Any]
        (viewController as! DetailPageViewController).item = _data["item"] as? Item
        (viewController as! DetailPageViewController).type = _data["type"] as? DetailPageTypes
        navigationController.pushViewController(viewController, animated: true)
    }
    
    override func navigate(scene: AppScene, data: Any) {
        
    }
    
    override func back(_ viewController: UIViewController) {
        navigationController.popViewController(animated: true)
    }
}


