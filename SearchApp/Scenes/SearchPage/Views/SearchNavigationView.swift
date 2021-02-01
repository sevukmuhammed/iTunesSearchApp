//
//  SearchNavigationView.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 26.01.2021.
//

import UIKit
import Reusable
import RxSwift
import RxCocoa

class SearchNavigationView: UIView, NibLoadable, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var searchSubject: BehaviorRelay<String>!
    let disposeBag = DisposeBag()
    
    
    override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.searchBar.delegate = self
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchSubject.accept(searchText)
        
    }
}

