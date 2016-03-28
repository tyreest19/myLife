//
//  homeCell.swift
//  mylife
//
//  Created by Tyree Stevenson on 3/23/16.
//  Copyright © 2016 Tyree Stevenson. All rights reserved.
//

import UIKit
class homeCell: UITableViewCell {
    @IBOutlet weak var dailyPic: UIImageView!
    @IBOutlet weak var dailyMoment: UILabel!
    @IBOutlet weak var dailyPost: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(post: Post) {
        dailyPic.image = post.getImage()
        dailyMoment.text = post.moment
        dailyPost.text = post.mood
    }
}

