//
//  LoginViewController.swift
//  Twitter
//
//  Created by Pedro Suchite on 2/26/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  override func viewDidAppear(_ animated: Bool) {
    if UserDefaults.standard.bool(forKey: "userLoggedIn") == true{
      self.performSegue(withIdentifier: "Login", sender: self)
    }
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func onLoginButton(_ sender: Any) {
      let twitterURL = "https://api.twitter.com/oauth/request_token"
      TwitterAPICaller.client?.login(url: twitterURL, success: {
        UserDefaults.standard.set(true, forKey: "userLoggedIn")
        self.performSegue(withIdentifier: "Login", sender: self)
    
      }, failure: { (Error) in
        print("could not log in user")
      })
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
