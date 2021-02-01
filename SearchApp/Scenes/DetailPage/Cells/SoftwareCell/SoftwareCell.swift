//
//  SoftwareCell.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 31.01.2021.
//

import UIKit
import Reusable
import Cosmos
import Kingfisher
import RxSwift

class SoftwareCell: UITableViewCell, NibReusable {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sellerNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var cosmosLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var webViewButton: UIButton!
    
    var disposeBag = DisposeBag()
    var cellData: Item? {
        didSet {
            guard let data = cellData else { return }
            cellImage.kf.setImage(with: URL(string: data.artworkUrl100 ?? ""))
            nameLabel.text = data.collectionName ?? data.trackName
            sellerNameLabel.text = data.sellerName
            if data.collectionPrice == 0 || data.collectionPrice == nil {
                priceLabel.text = "Free"
            } else {
                priceLabel.text = String(data.collectionPrice ?? 0) + " $"
            }
            dateLabel.text = data.releaseDate?.convertDateFormater()
            cosmosView.rating = data.averageUserRatingForCurrentVersion ?? 0
            cosmosView.settings.fillMode = .precise
            cosmosLabel.text = String(format: "%.1f", cosmosView.rating)
            descLabel.attributedText = data.description?.htmlToAttributedString
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        cosmosView.settings.updateOnTouch = false
        subscribeWebViewButton()
    }
    
    override func prepareForReuse() {
        cosmosView.prepareForReuse()
    }
    
}
