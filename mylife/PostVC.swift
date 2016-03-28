//
//  PostVC.swift
//  mylife
//
//  Created by Tyree Stevenson on 3/21/16.
//  Copyright © 2016 Tyree Stevenson. All rights reserved.
//

import UIKit
import CoreData

class PostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate {
    @IBOutlet weak var uploadBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var day: UITextField!
    let imagePicker = UIImagePickerController() // creates a image picker object
    var fetchedResultsController = NSFetchedResultsController!.self
    override func viewDidLoad() {
        super.viewDidLoad()
       uploadBtn.layer.cornerRadius = 10
        imagePicker.delegate = self // call image picker delegate on its self
        // Do any additional setup after loading the view.
        imageView.clipsToBounds = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        self.day.delegate = self
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
   
    @IBAction func imageButton(sender: UIButton) { // summons image picker
        imagePicker.allowsEditing = false // ask if pick wanna get edit
        imagePicker.sourceType = .PhotoLibrary // get photos from libarary
        presentViewController(imagePicker, animated: true, completion: nil) // open image piker c;ass
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            // conditional which says if picked image is a image then do following steps
            imageView.contentMode = .ScaleAspectFit // sets imageview to aspect fit
            imageView.image = pickedImage // makes image view picked image
            
        }
        dismissViewControllerAnimated(true, completion: nil) //dismisses image picker
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func uploadBtn(sender: UIButton) {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let entity = NSEntityDescription.entityForName("Post", inManagedObjectContext: context)!
        let post = Post(entity: entity, insertIntoManagedObjectContext: context)
        post.mood = day.text
        post.setImages(imageView.image!)
        context.insertObject(post)
        do {
            try context.save()
        }catch {
            print("could not save recipe")
        }
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    func textFieldShouldReturn(userText: UITextField!) -> Bool {
        day.resignFirstResponder()
        return true;
    }
}


  

