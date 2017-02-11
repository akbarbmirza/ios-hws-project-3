//
//  DetailViewController.swift
//  Storm Viewer
//
//  Created by Akbar Mirza on 2/7/17.
//  Copyright © 2017 Akbar Mirza. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    // Properties
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the title of our Detail View
        title = selectedImage
        
        // add a button on the right side of the navbar
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        // load our image
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    // Custom Methods
    func shareTapped() {
        
        // initialize the view controller
        let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
        
        // anchor the activity view controller to the share button
        // this line only affects iPad
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        // present the share screen
        present(vc, animated: true)
 
        /*
        // share with facebook
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
            // set the default share text
            vc.setInitialText("Look at this great picture!")
            // add the image that we're going to share
            vc.add(imageView.image!)
            // add the link that we're sharing
            vc.add(URL(string: "http://www.photolib.noaa.gov/nssl"))
            // present the screen
            present(vc, animated: true)
        }
        */
        
        /*
        // share with twitter
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
            // set the default share text
            vc.setInitialText("Look at this great picture!")
            // add the image that we're going to share
            vc.add(imageView.image!)
            // add the link that we're sharing
            vc.add(URL(string: "http://www.photolib.noaa.gov/nssl"))
            // present the screen
            present(vc, animated: true)
        }
        */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
