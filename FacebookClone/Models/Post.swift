//
//  Post.swift
//  FacebookClone
//
//  Created by Muhammad Hasnain Bangash on 18/11/2024.
//

import Foundation

struct Post {
    var type: PostType
    var userName: String
    var description: String?
    var videoFileName: String?
    var content: Any
}

enum PostType {
    case text
    case image
    case video
    case collage4
    case collage3Video
}
