//
//  SearchItemCell.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 29.01.2021.
//

import UIKit
import Reusable
import Kingfisher

class SearchItemCell: UICollectionViewCell, NibReusable {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var cellData: Item? {
        didSet{
            guard let data = cellData else {return}
            imageView.kf.setImage(with: URL(string: data.artworkUrl100 ?? ""))
            
             
            name.text = data.collectionName ?? data.trackName
            
            releaseDate.text = data.releaseDate?.convertDateFormater()
            
            price.text = String(data.collectionPrice ?? data.price ?? 0) + " $"
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
