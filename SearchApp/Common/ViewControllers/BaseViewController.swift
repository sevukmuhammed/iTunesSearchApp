//
//  BaseViewController.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 26.01.2021.
//

import Foundation
import RxSwift

public class BaseViewController: UIViewController {
    
    public let navigationSubject = PublishSubject<Navigation<Any>>()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}
