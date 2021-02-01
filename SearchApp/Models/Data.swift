//
//  Data.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 29.01.2021.
//

import Foundation


public struct Response: Codable {
    var results: [Item]?
    var resultCount: Int?
    enum CodingKeys: String, CodingKey {
        case results
        case resultCount
    }
    public init() {}
}

public class Item: Codable {
    
    var wrapperType: String?
    var kind: String?
    var artistId: Int?
    var collectionId: Int?
    var trackId: Int?
    var artistName: String?
    var collectionName: String?
    var trackName: String?
    var collectionCensoredName: String?
    var trackCensoredName: String?
    var artistViewUrl: String?
    var collectionViewUrl: String?
    var trackViewUrl: String?
    var previewUrl: String?
    var artworkUrl30: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var collectionPrice: Double?
    var trackPrice: Double?
    var collectionExplicitness: String?
    var trackExplicitness: String?
    var discCount: Int?
    var discNumber: Int?
    var trackCount: Int?
    var trackNumber: Int?
    var trackTimeMillis: Int?
    var country: String?
    var currency: String?
    var primaryGenreName: String?
    var isStreamable: Bool?
    var releaseDate: String?
    var longDescription: String?
    var sellerName: String?
    var averageUserRatingForCurrentVersion: Double?
    var averageUserRating: Double?
    var description: String?
    var price: Double?
    
    private enum CodingKeys: String, CodingKey {
        case wrapperType
        case kind
        case artistId
        case collectionId
        case trackId
        case artistName
        case collectionName
        case trackName
        case collectionCensoredName
        case trackCensoredName
        case artistViewUrl
        case collectionViewUrl
        case trackViewUrl
        case previewUrl
        case artworkUrl30
        case artworkUrl60
        case artworkUrl100
        case collectionPrice
        case trackPrice
        case collectionExplicitness
        case trackExplicitness
        case discCount
        case discNumber
        case trackCount
        case trackNumber
        case trackTimeMillis
        case country
        case currency
        case primaryGenreName
        case isStreamable
        case releaseDate
        case longDescription
        case sellerName
        case averageUserRatingForCurrentVersion
        case averageUserRating
        case description
        case price
    }
    
    public init() {}
}
