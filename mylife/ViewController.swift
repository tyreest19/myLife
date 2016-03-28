//
//  ViewController.swift
//  mylife
//
//  Created by Tyree Stevenson on 3/21/16.
//  Copyright © 2016 Tyree Stevenson. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var post = [Post]()
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(animated: Bool) {
        setAndFetchResults()
        tableView.reloadData()
    }
    func setAndFetchResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Post")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.post = results as! [Post]
        }catch let err as NSError {
            print(err.debugDescription)
        }
        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("homeCell") as? homeCell {
            
            let homeCell = post[indexPath.row]
            cell.configure(homeCell)
            return cell
        }
        else{
            return homeCell()
        }
        
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  post.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    @IBAction func goToPost(btn: UIButton){
        performSegueWithIdentifier("Post", sender: nil)
    }

}

