//
//  ViewController.swift
//  Storm Viewer
//
//  Created by Akbar Mirza on 2/7/17.
//  Copyright © 2017 Akbar Mirza. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // create a property to hold our pictures
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set the title of our navigationBar
        title = "Storm Viewer"
        
        // code to load the NSSL images
        // ---------------------------------------------------------------------
        // this lets us work with the file system
        let fm = FileManager.default
        // declare a path set to the resource path of our app's bundle
        let path = Bundle.main.resourcePath!
        // declare a value that holds the contents of our path
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                
                // add nssl photos to our pictures array
                pictures.append(item)
            }
        }
        
        // NOTE: DEBUG Code
        print(pictures)
        // ---------------------------------------------------------------------
    }
    
    // function that handles number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // function that handles dequeuing cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1. try loading the "Detail" View Controller and type cast it as a DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            // 2. success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            
            // 3. now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

