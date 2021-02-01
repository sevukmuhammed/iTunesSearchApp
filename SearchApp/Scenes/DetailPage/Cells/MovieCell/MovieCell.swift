//
//  MovieCell.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 31.01.2021.
//

import UIKit
import Reusable
import Kingfisher
import RxSwift

class MovieCell: UITableViewCell, NibReusable {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webViewButton: UIButton!
    
    var disposeBag = DisposeBag()
    var cellData: Item? {
        didSet{
            guard let data = cellData else { return }
            cellImage.kf.setImage(with: URL(string: data.artworkUrl100 ?? ""))
            nameLabel.text = data.collectionName ?? data.trackName
            artistLabel.text = data.artistName
            if data.collectionPrice == 0 || data.collectionPrice == nil {
                priceLabel.text = "Free"
            } else {
                priceLabel.text = String(data.collectionPrice ?? 0) + " $"
            }
            
            descLabel.attributedText = data.longDescription?.htmlToAttributedString
            countryLabel.text = data.country
            dateLabel.text = data.releaseDate?.convertDateFormater()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subscribeWebViewButton()
    }

}
