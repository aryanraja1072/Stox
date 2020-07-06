//
//  HomeViewController.swift
//  Stox
//
//  Created by Devika Raja on 04/07/20.
//  Copyright © 2020 Devika Raja. All rights reserved.
//

import UIKit
import GoogleSignIn
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 GIDSignIn.sharedInstance()?.presentingViewController = self
        navigationController?.navigationBar.isHidden=false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapSignOut(_ sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
        navigationController?.navigationBar.isHidden = true
        navigationController?.popToRootViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
