//
//  VideoCell.swift
//  FacebookClone
//
//  Created by Muhammad Hasnain Bangash on 18/11/2024.
//

import UIKit
import AVKit
import AVFoundation

class VideoCell: UITableViewCell {

    @IBOutlet weak var videoContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?

    func cellData(with videoFileName: String) {
        if let path = Bundle.main.path(forResource: videoFileName, ofType: "mp4") {
            let videoURl = URL(fileURLWithPath: path)
            let videoPlayer = AVPlayer(url: videoURl)
            let playerLayer = AVPlayerLayer(player: videoPlayer)
            playerLayer.frame = contentView.bounds
            contentView.layer.addSublayer(playerLayer)
            videoPlayer.play()
        } else {
            print("No video available now")
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        player?.play()
    }
}
