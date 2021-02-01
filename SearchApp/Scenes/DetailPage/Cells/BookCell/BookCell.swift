//
//  BookCell.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 31.01.2021.
//

import UIKit
import Reusable
import Cosmos
import Kingfisher
import RxSwift
import RxCocoa

class BookCell: UITableViewCell, NibReusable {

    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var webViewButton: UIButton!
    @IBOutlet weak var cosmosLabel: UILabel!
    var disposeBag = DisposeBag()
    var cellData: Item? {
        didSet{
            guard let data = cellData else { return }
            cellImage.kf.setImage(with: URL(string: data.artworkUrl100 ?? ""))
            nameLabel.text = data.trackName
            artistLabel.text = data.artistName
            if data.price == 0 || data.price == nil {
                priceLabel.text = "Free"
            } else {
                priceLabel.text = String(data.price ?? 0) + " $"
            }
            dateLabel.text = data.releaseDate?.convertDateFormater()
            cosmosView.rating = data.averageUserRating ?? 0
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
    
}
