//
//  SearchPageRepository.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 29.01.2021.
//

import Foundation
import RxSwift

final class SearchPageRepository {
    
    func getSearchResults<T>(_ dump: T.Type, term: String, media: String, limit: Int) -> Observable<T> where T : Decodable, T : Encodable {
        return provider.rx
            .request(.search(term, media, limit))
            .observeOn(MainScheduler.instance)
            .map(T.self)
            .asObservable()
    }
    
}

