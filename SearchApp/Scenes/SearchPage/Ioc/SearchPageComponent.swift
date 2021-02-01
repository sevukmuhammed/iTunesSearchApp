//
//  SearchPageComponent.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 26.01.2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import RxSwift

final class SearchPageComponent {
    static func register(_ container: Container) {
        
        container.autoregister(SearchPageViewModel.self, initializer: SearchPageViewModel.init)
        container.autoregister(SearchPageRepository.self, initializer: SearchPageRepository.init)
        
        container.storyboardInitCompleted(SearchPageViewController.self) { r, c in
            c.disposeBag = r.resolve(DisposeBag.self)
            c.viewModel = r.resolve(SearchPageViewModel.self)
            c.container = container
        }
    }
}
