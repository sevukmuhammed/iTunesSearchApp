//
//  SearchPageViewController.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 26.01.2021.
//

import Foundation
import RxSwift
import RxCocoa
import Swinject

final class SearchPageViewController: BaseViewController, SearchPageStoryboardLoadable {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    var isPageRefreshing:Bool = false
    var container: Container!
    var viewModel: SearchPageViewModel!
    var disposeBag: DisposeBag!
    var searchBar = UISearchBar()
    var searchSubject = BehaviorRelay<String>(value: "")
    var totalCount : NSInteger?
    var isGetResponse : Bool = true
    var activityIndiator : UIActivityIndicatorView?
    var limit = 20
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.subscribeAll()
        self.setupNavigationBarButtons()
        self.bindCollectionView()
        self.searchBar.becomeFirstResponder()
        
        
    }

    func setupNavigationBarButtons() {
        let navigationView = SearchNavigationView.loadFromNib()
        navigationView.searchSubject = self.searchSubject
        searchBar = navigationView.searchBar
        self.navigationItem.titleView = navigationView
        self.navigationController?.navigationBar.barTintColor = .white
        
    }
    
}
