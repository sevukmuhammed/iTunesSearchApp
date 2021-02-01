//
//  SearchPageStoryboardLoadable.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 26.01.2021.
//

import Foundation
import UIKit

public protocol SearchPageStoryboardLoadable: StoryboardLoadable {}

extension SearchPageStoryboardLoadable where Self: UIViewController {
    @nonobjc static var storyboardName: String {
        return "SearchPage"
    }
}
