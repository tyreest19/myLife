//
//  Post.swift
//  mylife
//
//  Created by Tyree Stevenson on 3/21/16.
//  Copyright © 2016 Tyree Stevenson. All rights reserved.
//

import UIKit

class Post: AnyObject {
    var image: UIImage
    var mood: String!
    var day: String!
    init(image: UIImage, mood: String, day: String) {
        self.image = image
        self.day = day
        self.mood = mood
    }
}
