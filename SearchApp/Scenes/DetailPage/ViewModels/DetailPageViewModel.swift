//
//  DetailPageViewModel.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 30.01.2021.
//

import Foundation
import RxSwift
import RxCocoa

final class DetailPageViewModel: BaseViewModel {
    
    var sections = BehaviorRelay<Array<DetailPageSectionModel>>(value: [])
    init(disposeBag: DisposeBag) {
        super.init()
        self.disposeBag = disposeBag
    }
    
    private func defineSections(_ data: Item, type: DetailPageTypes) -> [DetailPageSectionModel] {
        var sections = [DetailPageSectionModel]()
        switch type {
        case .MovieDetail:
            sections.append(.MovieSection(item: [.MovieSectionItem(data: data)]))
        case .SongDetail:
            sections.append(.SongSection(item: [.SongSectionItem(data: data)]))
        case .SoftwareDetail:
            sections.append(.SoftwareSection(item: [.SoftwareSectionItem(data: data)]))
        case .BookDetail:
            sections.append(.BookSection(item: [.BookSectionItem(data: data)]))
        }
        
        return sections
    }
    
    internal func getData(data: Item, type: DetailPageTypes) {
        let sections = self.defineSections(data, type: type)
        self.sections.accept(sections)
    }
}

