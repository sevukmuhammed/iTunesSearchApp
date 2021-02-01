//
//  BookCell+UIAction.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 31.01.2021.
//

import Foundation
import RxSwift
import RxCocoa
import SafariServices

extension BookCell {
    func subscribeWebViewButton() {
        webViewButton.rx.tap.bind{ [weak self] _ in
            if let url = URL(string: self?.cellData?.trackViewUrl ?? "") {
                    let config = SFSafariViewController.Configuration()
                    config.entersReaderIfAvailable = true

                    let vc = SFSafariViewController(url: url, configuration: config)
                    UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true)
                }
        }.disposed(by: self.disposeBag)
    }
}
