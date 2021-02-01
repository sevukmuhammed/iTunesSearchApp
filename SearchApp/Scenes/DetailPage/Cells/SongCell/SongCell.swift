//
//  SongCell.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 31.01.2021.
//

import UIKit
import Reusable
import Kingfisher
import RxSwift

class SongCell: UITableViewCell, NibReusable {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var songTypeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var webViewButton: UIButton!
    @IBOutlet weak var songNameLabel: UILabel!
    
    var disposeBag = DisposeBag()
    var cellData: Item? {
        didSet {
            guard let data = cellData else { return }
            cellImage.kf.setImage(with: URL(string: data.artworkUrl100 ?? ""))
            collectionNameLabel.text = data.collectionName
            artistNameLabel.text = data.artistName
            if data.collectionPrice == 0 || data.collectionPrice == nil {
                priceLabel.text = "Free"
            } else {
                priceLabel.text = String(data.collectionPrice ?? 0) + " $"
            }
            songTypeLabel.text = data.primaryGenreName
            dateLabel.text = data.releaseDate?.convertDateFormater()
            countryLabel.text = data.country
            songNameLabel.text = data.trackName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subscribeWebViewButton()
    }
    
}
