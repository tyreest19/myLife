//
//  Post.swift
//  mylife
//
//  Created by Tyree Stevenson on 3/23/16.
//  Copyright © 2016 Tyree Stevenson. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Post: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    func setImages(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    func getImage() -> UIImage {
        let img = UIImage(data: self.image!)
        return img!
    }
}
