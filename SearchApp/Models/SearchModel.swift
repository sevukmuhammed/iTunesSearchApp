//
//  SearchModel.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 29.01.2021.
//
import Foundation

struct Search {
    let term: String
    var media: String
}

struct Filter {
    let id = UUID().uuidString
    let name: String
    var selected: Bool
}
