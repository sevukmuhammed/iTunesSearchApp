//
//  SearchPageViewController+CollectionView.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 29.01.2021.
//

import Foundation
import RxDataSources
import RxCocoa
import RxSwift

extension SearchPageViewController : UICollectionViewDataSource {
    
    
    internal func bindCollectionView() {
        registerCollectionViewCells()
        setupCollectionViewClickEvent()
    }
    
    private func registerCollectionViewCells() {
        collectionView.register(cellType: SearchItemCell.self)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
        return viewModel.behaviorRelay.value.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchItemCell", for: indexPath) as! SearchItemCell
        cell.cellData = viewModel.behaviorRelay.value.results?[indexPath.row]
        return cell
    }
    
    func setupCollectionViewClickEvent() {
        collectionView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            guard let cell = self?.collectionView.cellForItem(at: indexPath) as? SearchItemCell else {return}
            guard let item = cell.cellData else {return}
            
            switch self?.segmentedControl.selectedSegmentIndex {
            case 0:
                self?.navigationSubject.onNext(Navigation<Any>(DetailScene.detail, data: ["item": item, "type": DetailPageTypes.MovieDetail]))
            case 1:
                self?.navigationSubject.onNext(Navigation<Any>(DetailScene.detail, data: ["item": item, "type": DetailPageTypes.SongDetail]))
            case 2:
                self?.navigationSubject.onNext(Navigation<Any>(DetailScene.detail, data: ["item": item, "type": DetailPageTypes.SoftwareDetail]))
            case 3:
                self?.navigationSubject.onNext(Navigation<Any>(DetailScene.detail, data: ["item": item, "type": DetailPageTypes.BookDetail]))
            default:
                self?.navigationSubject.onNext(Navigation<Any>(DetailScene.detail, data: ["item": item, "type": DetailPageTypes.MovieDetail]))
            }
        }).disposed(by: disposeBag)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.behaviorRelay.value.results?.count ?? 0 - 1 {
            if viewModel.behaviorRelay.value.results?.count ?? 0 < 200 {
                var index = viewModel.behaviorRelay.value.results?.count ?? 0
                limit = index + 20
                
            }
        }
    }
    
}


extension SearchPageViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return CGSize(width: (collectionView.frame.width - 20) / 2, height: ((collectionView.frame.width - 10) / 2) * 16 / 9)
        case 1:
            return CGSize(width: (collectionView.frame.width - 20) / 2, height: (collectionView.frame.width - 10) / 2)
        case 2:
            return CGSize(width: (collectionView.frame.width - 20) / 2, height: (collectionView.frame.width - 10) / 2)
        case 3:
            return CGSize(width: (collectionView.frame.width - 20) / 2, height: ((collectionView.frame.width - 10) / 2) * 16 / 9)
        default:
            return CGSize(width: (collectionView.frame.width - 20) / 2, height: (collectionView.frame.width - 10) / 2)
        }
        
        
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
       return 5
    }

}


