//
//  CarouselCell.swift
//  Insta
//
//  Created by Aravind on 13/06/21.
//

import UIKit
import Kingfisher

class CarouselCell: UICollectionViewCell {

    public static let identifier: String = "CarouselCell"

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
  override func awakeFromNib() {
    super.awakeFromNib()

  }
    
    
    func configureCell(with photo:ImageMeta){


        if  let urlString =  photo.images?.first?.link, let url = URL(string: urlString){
            let resource = ImageResource(downloadURL: url)
            thumbImageView.kf.setImage(with:resource)
        }

    }
}
