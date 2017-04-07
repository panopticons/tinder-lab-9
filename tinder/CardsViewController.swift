//
//  ViewController.swift
//  tinder
//
//  Created by fer on 4/4/17.
//  Copyright © 2017 fer. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

  var cardInitialCenter: CGPoint!
  
  @IBOutlet weak var picture: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  @IBAction func click(_ sender: Any) {
    performSegue(withIdentifier: "toProfile", sender: sender)
  }

  @IBAction func drag(_ sender: UIPanGestureRecognizer) {
    let translation = sender.translation(in: view)
    let touch = sender.location(in: picture)
    
    if sender.state == .began {
      cardInitialCenter = picture.center
    } else if sender.state == .changed {
      picture.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
      print(cardInitialCenter)
      
      /*if translation.x < 0 {
        picture.transform = CGAffineTransform(rotationAngle: CGFloat(325 * M_PI / 180))
      }
      else if translation.x > 0
      {
        picture.transform = CGAffineTransform(rotationAngle: CGFloat(35 * M_PI / 180))
      }*/
      
      if(touch.y < cardInitialCenter.y)
      {
        picture.transform = picture.transform.rotated(by: CGFloat((Double (translation.x/36) * Double.pi / 360)))
      }
      else
      {
        picture.transform = picture.transform.rotated(by: CGFloat((Double (-translation.x/36) * Double.pi / 360)))
      }
    } else if sender.state == .ended {
      
      if(abs(translation.x) > 50)
      {
        picture.center = cardInitialCenter
        picture.transform = CGAffineTransform.identity
        picture.alpha = 0
        
        UIView.animate(withDuration: 0, delay: 5.0, animations: {
          self.picture.alpha = 1
        }, completion: nil)
      }
      else
      {
        picture.center = cardInitialCenter
        picture.transform = CGAffineTransform.identity
      }
      
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    let dest = segue.destination as! ProfileViewController
    dest.pic = picture.image
    
  }
}

