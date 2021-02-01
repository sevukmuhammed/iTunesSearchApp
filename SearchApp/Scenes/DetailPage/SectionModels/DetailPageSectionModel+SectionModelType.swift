//
//  DetailPageSectionModel+SectionModelType.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 31.01.2021.
//

import Foundation
import RxDataSources
import Differentiator
import RxCocoa
import RxSwift

extension DetailPageSectionModel: SectionModelType {
    
    typealias Item = DetailSectionItem
    
    var items: [DetailSectionItem] {
        switch self {
        case .MovieSection(item: let items):
            return items.map{$0}
        case .SongSection(item: let items):
            return items.map{$0}
        case .SoftwareSection(item: let items):
            return items.map{$0}
        case .BookSection(item: let items):
            return items.map{$0}
        }
    }
    init(original: DetailPageSectionModel, items: [DetailSectionItem]) {
        switch original {
        case .MovieSection(item: let items):
            self = .MovieSection(item: items)
        case .SongSection(item: let items):
            self = .SongSection(item: items)
        case .SoftwareSection(item: let items):
            self = .SoftwareSection(item: items)
        case .BookSection(item: let items):
            self = .BookSection(item: items)
        }
    }
}
