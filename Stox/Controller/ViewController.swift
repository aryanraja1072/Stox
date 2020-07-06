//
//  ViewController.swift
//  Stox
//
//  Created by Devika Raja on 01/07/20.
//  Copyright © 2020 Devika Raja. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
class ViewController: UIViewController,GIDSignInDelegate {

    @IBOutlet weak var stoxLabel: UILabel!
    @IBOutlet weak var loginStack: UIStackView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        stoxLabel.center.y = view.bounds.height/2
        signInButton.backgroundColor = .green
        signUpButton.backgroundColor = .systemBlue
            loginStack.alpha = 0;
        
        animateTitleToTop()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        GIDSignIn.sharedInstance()?.signIn()
        
    
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
                GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    func animateTitleToTop(){
        UIView.animate(withDuration: 1.5, delay: 1, options: .curveEaseInOut, animations: {
            self.stoxLabel.center.y -= 0.7*(self.view.bounds.height/2)
        },completion: nil)
        UIView.animate(withDuration: 1.5, delay: 1.25, options: .curveEaseInOut, animations: {
            self.loginStack.alpha=1
        }, completion: nil)
    }
    func transitionToHomeView(){
        performSegue(withIdentifier: "googleSignInToHome", sender: self)
    }
   func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {

            // perform your log in functions here...

            // ex. assign user profile data to variables
            print(user.profile.name)
            transitionToHomeView()
            // etc.

            // Sign out of Google when logic completes for security purposes
            GIDSignIn.sharedInstance().signOut()

        } else {
            print(error.localizedDescription)
        }
    }
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
        }
    }


}

