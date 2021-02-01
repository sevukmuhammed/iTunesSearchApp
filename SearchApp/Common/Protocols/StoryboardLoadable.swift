//
//  StoryboardLoadable.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 26.01.2021.
//

import UIKit

public protocol StoryboardLoadable: AnyObject {
    @nonobjc static var storyboardName: String { get }
}
