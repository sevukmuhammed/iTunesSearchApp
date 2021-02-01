//
//  DetailPageSectionModels.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 31.01.2021.
//

import Foundation
import RxDataSources
import Differentiator
import RxCocoa
import RxSwift

enum DetailPageSectionModel {
    case MovieSection(item: [DetailSectionItem])
    case SongSection(item: [DetailSectionItem])
    case SoftwareSection(item: [DetailSectionItem])
    case BookSection(item: [DetailSectionItem])
    
    var estimatedHeight: CGFloat {
        switch self {
        case .MovieSection:
            return UITableView.automaticDimension
        case .SongSection:
            return UITableView.automaticDimension
        case .SoftwareSection:
            return UITableView.automaticDimension
        case .BookSection:
            return UITableView.automaticDimension
        }
    }
}

enum DetailSectionItem {
    case MovieSectionItem(data: Item)
    case SongSectionItem(data: Item)
    case SoftwareSectionItem(data: Item)
    case BookSectionItem(data: Item)
}
