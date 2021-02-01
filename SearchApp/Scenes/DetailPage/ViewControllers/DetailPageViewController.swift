//
//  DetailPageViewController.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 30.01.2021.
//

import Foundation
import RxSwift

final class DetailPageViewController: BaseViewController, DetailPageStoryboardLoadable {
    
    @IBOutlet weak var tableView: UITableView!
    
    var disposeBag: DisposeBag!
    var viewModel: DetailPageViewModel!
    var type: DetailPageTypes!
    var item: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewDataBinding(data: item, type: type)
        initializeTableView()
    }
}
