//
//  CollageCell.swift
//  FacebookClone
//
//  Created by Muhammad Hasnain Bangash on 18/11/2024.
//

import UIKit

class CollageCell: UITableViewCell {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellData(with images: [UIImage], description: String) {
        imageView1.image = images[0]
        imageView2.image = images[1]
        imageView3.image = images[2]
        imageView4.image = images[3]
        descriptionLabel.text = description
    }
    
}
