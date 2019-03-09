//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Pedro Suchite on 3/1/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
  @IBOutlet weak var profileImageView: UIImageView!
  
  @IBOutlet weak var userNameLabel: UILabel!
  
  @IBOutlet weak var tweetContent: UILabel!
  @IBOutlet weak var favButton: UIButton!
  @IBOutlet weak var retweetButton: UIButton!
  
  
  var favorited:Bool = false  //set favorited status for tweet
  var tweetId:Int = -1        //set API call to set favorited or not
 
  
  @IBAction func favoriteTweet(_ sender: Any) {
    let toBeFavorited = !favorited
    if(toBeFavorited){
      TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
        self.isFavorited(true)
      }, failure: { (Error) in
        print("OOPS tweet could not be favorited \(Error)")
      })
    } else {
      TwitterAPICaller.client?.unFavoriteTweet(tweetId: tweetId, success: {
        self.isFavorited(false)
      }, failure: { (Error) in
        print("OOPS tweet could not be unFavorited \(Error)")
      })
    }
  }

  func isFavorited(_ isFavorited:Bool){
    favorited = isFavorited
    if(favorited){
      favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControlState.normal)
    } else {
      favButton.setImage(UIImage(named: "favor-icon-1"), for: UIControlState.normal)
    }
  }
  
  func setRetweeted(_ isRetweeted:Bool){
    if(isRetweeted){
      retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControlState.normal)
      retweetButton.isEnabled = false
    } else {
      retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControlState.normal)
      retweetButton.isEnabled = true
    }
  }
  
  @IBAction func retweet(_ sender: Any) {
    TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
      self.setRetweeted(true)
    }, failure: { (Error) in
      print("Error is retweeting \(Error)")
    })
     
  }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
