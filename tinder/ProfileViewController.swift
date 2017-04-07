//
//  ProfileViewController.swift
//  tinder
//
//  Created by fer on 4/6/17.
//  Copyright © 2017 fer. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
  
  var pic: UIImage!
  
  @IBOutlet weak var profilePic: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      profilePic.image = pic
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func leave(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
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
