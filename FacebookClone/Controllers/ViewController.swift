//
//  ViewController.swift
//  FacebookClone
//
//  Created by Muhammad Hasnain Bangash on 18/11/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var posts = [
        
        Post(type: .text, userName: "Trevor", content: "The greatest glory in living lies not in never falling, but in rising every time we fall." ),
    
        Post(type: .image, userName: "Franklin", description: "Amazing view of night", content: UIImage(named: "picture4")!),
        
        Post(type: .video, userName: "Michael", videoFileName: "Simple Video", content: UIImage(named: "picture5")!),
        
        Post(type: .collage4, userName: "Jimmy", description: "Amazing Collage of Nature Beauty", content: [
            UIImage(named: "picture2")!,
            UIImage(named: "picture5")!,
            UIImage(named: "picture1")!,
            UIImage(named: "picture3")!
        ]),
        
        Post(type: .collage3Video, userName: "John", videoFileName: "Sample Video", content: [
            UIImage(named: "picture2")!,
            UIImage(named: "picture5")!,
            UIImage(named: "picture4")!
        ])
    ]
    
    var profileImages = [
        UIImage(named: "picture2"),
        UIImage(named: "picture5"),
        UIImage(named: "picture1"),
        UIImage(named: "picture4"),
        UIImage(named: "picture3")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: K.NibNames.headerCellNibName, bundle: nil), forCellReuseIdentifier: K.Identifiers.headerCellIdentifier)
        
        tableView.register(UINib(nibName: K.NibNames.footerCellNibName, bundle: nil), forCellReuseIdentifier: K.Identifiers.footerCellIdentifier)
        
        tableView.register(UINib(nibName: K.NibNames.collageCellNibName, bundle: nil), forCellReuseIdentifier: K.Identifiers.collageCellIdentifier)
        
        tableView.register(UINib(nibName: K.NibNames.imageCellNibName, bundle: nil), forCellReuseIdentifier: K.Identifiers.imageCellIdentifier)
        
        tableView.register(UINib(nibName: K.NibNames.mixCollageCellNibName, bundle: nil), forCellReuseIdentifier: K.Identifiers.mixCollageCellIdentifier)
        
        tableView.register(UINib(nibName: K.NibNames.textCellNibName, bundle: nil), forCellReuseIdentifier: K.Identifiers.textCellIdentifier)
        
        tableView.register(UINib(nibName: K.NibNames.videoCellNibName, bundle: nil), forCellReuseIdentifier: K.Identifiers.videoCellIdentifier)
    }

}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.section]

        switch post.type {
        case .text:
            let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.textCellIdentifier, for: indexPath) as! TextCell
            cell.cellData(with: post.content as! String)
            return cell

        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.imageCellIdentifier, for: indexPath) as! ImageCell
            cell.cellData(with: post.content as! UIImage, description: post.description ?? "No Data")
            return cell

        case .video:
            let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.videoCellIdentifier, for: indexPath) as! VideoCell
            if let videoFileName = post.videoFileName {
                cell.cellData(with: videoFileName)
            }
            return cell

        case .collage4:
            let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.collageCellIdentifier, for: indexPath) as! CollageCell
            cell.cellData(with: post.content as! [UIImage], description: post.description ?? "No Data")
            return cell

        case .collage3Video:
            let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.mixCollageCellIdentifier, for: indexPath) as! MixCollageCell
            
            if let imagesCollage = post.content as? [UIImage] {
                cell.cellDataForImages(with: imagesCollage)
            } else {
                print("No pictures found")
            }
            
            if let videoFileName = post.videoFileName {
                cell.cellDataForVideo(with: videoFileName)
            } else {
                print("No video found error")
            }
            
            return cell
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let post = posts[indexPath.section]
        
        switch post.type {
        case .text:
            return 120
        case .image:
            return 300
        case .video:
            return 250
        case .collage4:
            return 330
        case .collage3Video:
            return 300
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let post = posts[section]
        print("-------------------------------------------------")
        print(section)
        print("-------------------------------------------------")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.headerCellIdentifier) as! HeaderCell
        cell.nameLabel.text = post.userName
        cell.profileImage.image = profileImages[section]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        print("-------------------------------------------------")
        print(section)
        print("-------------------------------------------------")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.footerCellIdentifier) as! FooterCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    
}
