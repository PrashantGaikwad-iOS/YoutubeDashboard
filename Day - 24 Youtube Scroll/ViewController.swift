//
//  ViewController.swift
//  Day - 24 Youtube Scroll
//
//  Created by Prashant Gaikwad on 2/20/18.
//  Copyright © 2018 Prashant Gaikwad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var collectionView: UICollectionView!
  
  @IBOutlet weak var homeButton: UIButton!
  @IBOutlet weak var recentButton: UIButton!
  @IBOutlet weak var savedButton: UIButton!
  @IBOutlet weak var profileButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

//MARK: Other Methods
extension ViewController {
  
  //Code to make collectionview fit to screen and logic to move horizontally with pagination is given on Storyboard.
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    self.collectionView!.contentInset = UIEdgeInsets(top: 0, left: 0, bottom:0, right: 0)
    if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
      layout.minimumInteritemSpacing = 0
      layout.minimumLineSpacing = 0
      layout.itemSize = CGSize(width: self.view.frame.size.width, height: self.collectionView.frame.size.height-10)
      layout.invalidateLayout()
    }
  }
  
    @IBAction func tabButtonsAction(_ sender: UIButton) {
      
      //Make alpha 0.4 to show buttons disabled
      homeButton.alpha = 0.4
      recentButton.alpha = 0.4
      savedButton.alpha = 0.4
      profileButton.alpha = 0.4
      
      //Scroll to particular index with animation
      if sender.tag == 101 {
        homeButton.alpha = 1.0
        self.collectionView.scrollToItem(at: [0,0], at: .centeredHorizontally, animated: true)
      }
      else if sender.tag == 102 {
        recentButton.alpha = 1.0
        self.collectionView.scrollToItem(at: [0,1], at: .centeredHorizontally, animated: true)
      }
      else if sender.tag == 103 {
        savedButton.alpha = 1.0
        self.collectionView.scrollToItem(at: [0,2], at: .centeredHorizontally, animated: true)
      }
      else if sender.tag == 104 {
        profileButton.alpha = 1.0
        self.collectionView.scrollToItem(at: [0,3], at: .centeredHorizontally, animated: true)
      }
    }
    
}

//MARK: CollectionView Methods
extension ViewController: UICollectionViewDelegate , UICollectionViewDataSource{
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! YoutubeCollectionViewCellClass
    if indexPath.row == 0 {
      
      cell.tabImageView.image = UIImage(named:"1")
    }
    else if indexPath.row == 1 {
      
      cell.tabImageView.image = UIImage(named:"2")
    }
    else if indexPath.row == 2 {
      
      cell.tabImageView.image = UIImage(named:"3")
    }
    else if indexPath.row == 3 {
      
      cell.tabImageView.image = UIImage(named:"4")
    }
    return cell
  }
  
  
  // Called before the cell is displayed
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    
    //Make alpha 0.4 to show buttons disabled
    homeButton.alpha = 0.4
    recentButton.alpha = 0.4
    savedButton.alpha = 0.4
    profileButton.alpha = 0.4
    
    //Scroll to particular index with animation
    if indexPath.row == 0 {
      homeButton.alpha = 1.0
    }
    else if indexPath.row == 1 {
      recentButton.alpha = 1.0
    }
    else if indexPath.row == 2 {
      savedButton.alpha = 1.0
    }
    else if indexPath.row == 3 {
      profileButton.alpha = 1.0
    }
    
  }
  
  // Called when the cell is displayed
  func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    //print(indexPath.row)
  }
  
  
}

//MARK: CollectionView Cell class
class YoutubeCollectionViewCellClass : UICollectionViewCell {
  
  @IBOutlet weak var tabImageView: UIImageView!
  
  
}
