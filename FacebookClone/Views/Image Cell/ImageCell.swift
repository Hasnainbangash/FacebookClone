//
//  Image Cell.swift
//  FacebookClone
//
//  Created by Muhammad Hasnain Bangash on 18/11/2024.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellData(with image: UIImage) {
            postImageView.image = image
    }
    
}
