//
//  TweetViewController.swift
//  Twitter
//
//  Created by Pedro Suchite on 3/5/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

  @IBOutlet weak var tweetTextView: UITextView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }

  @IBAction func cancel(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func Tweet(_ sender: Any) {
    if(!tweetTextView.text.isEmpty){
      TwitterAPICaller.client?.postTweets(tweetString: tweetTextView.text, success: {self.dismiss(animated: true, completion: nil)}, failure: { (Error) in
        print("Error Posting Tweet \(Error)")
        self.dismiss(animated: true, completion: nil)
      })
    } else {
      self.dismiss(animated: true, completion: nil)
    }
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
