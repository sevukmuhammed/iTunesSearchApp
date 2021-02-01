//
//  SearchPageViewController+Subscribe.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 29.01.2021.
//

import Foundation
import RxCocoa
import RxSwift

extension SearchPageViewController {
    func subscribeAll() {
        subscribeViewModel()
        subscribeForRequest()
        subscribeSegmentedControl()
    }
    
    func subscribeViewModel() {
        self.viewModel
            .behaviorRelay
            .subscribe(onNext: { value in
            self.collectionView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    
    func subscribeForRequest() {
        Observable.combineLatest(searchSubject,segmentedControl.rx.selectedSegmentIndex, viewModel.pageRelay).subscribe(onNext: { searchText, segmentValue, paginationValue in
            switch segmentValue {
            case 0:
                if searchText.count >= 2 {
                    self.viewModel.getData(term: searchText, media: MediaType.MOVIE.rawValue, limit: paginationValue)
                    
                } else {
                    self.viewModel.getData(term: "", media: "", limit: 0)
                }
                
                break
            case 1:
                if searchText.count >= 2 {
                    self.viewModel.getData(term: searchText, media: MediaType.MUSIC.rawValue, limit: paginationValue)
                    
                } else {
                    self.viewModel.getData(term: "", media: "", limit: 0)
                }
                
                break
            case 2:
                if searchText.count >= 2 {
                    self.viewModel.getData(term: searchText, media: MediaType.APP.rawValue, limit: paginationValue)
                    
                } else {
                    self.viewModel.getData(term: "", media: "", limit: 0)
                }
                
                break
            case 3:
                if searchText.count >= 2 {
                    self.viewModel.getData(term: searchText, media: MediaType.BOOK.rawValue, limit: paginationValue)
                    
                } else {
                    self.viewModel.getData(term: "", media: "", limit: 0)
                }
                
                break
            default:
                if searchText.count >= 2 {
                self.viewModel.getData(term: "", media: "", limit: paginationValue)
                    
                } else {
                    self.viewModel.getData(term: "", media: "", limit: 0)
                }
             
            }
        }).disposed(by: disposeBag)
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if indexPath.row == viewModel.pageRelay.value - 1 {  //numberofitem count
//                updateNextSet()
//            SearchPageViewController.paginationCounter = SearchPageViewController.paginationCounter + 20
//
//            Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (timer:Timer) in
//                self.viewModel.pageRelay.accept(self.viewModel.pageRelay.value + 20)
//            })
//
//                print("deneme=> ", viewModel.pageRelay.value)
//            }
//    }
    
    
    func subscribeSegmentedControl() {
        segmentedControl
            .rx
            .selectedSegmentIndex
            .subscribe(onNext: { index in

                self.collectionView?.scrollToItem(at: IndexPath(row: 0, section: 0),
                                                  at: .top,
                                            animated: true)


        }).disposed(by: disposeBag)
    }
    
    
}
