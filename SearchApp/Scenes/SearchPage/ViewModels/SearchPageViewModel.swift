//
//  SearchPageViewModel.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 26.01.2021.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

final class SearchPageViewModel: BaseViewModel {
    
    private var repository: SearchPageRepository!
    var behaviorRelay = BehaviorRelay<Response>(value: Response())
    var pageRelay = BehaviorRelay<Int>(value: 200)
    init(disposeBag: DisposeBag, SearchPageRepository: SearchPageRepository) {
        super.init()
        self.disposeBag = disposeBag
        self.repository = SearchPageRepository
    }
    
    func getData(term: String, media: String, limit: Int) {
        self.repository.getSearchResults(Response.self, term: term, media: media, limit: limit).subscribe(onNext: { data in
            self.behaviorRelay.accept(data)
        }, onError: { error in
            print("Error => \(error.localizedDescription)")
            self.behaviorRelay.accept(Response())
        }).disposed(by: disposeBag)
    }
    
}
