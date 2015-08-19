//
//  LoginViewController.swift
//  SpotifyMonthly
//
//  Created by Katelyn Findlay on 8/13/15.
//  Copyright (c) 2015 Katelyn Findlay. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var loginButton :UIButton?
    var authViewController :SPTAuthViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blackColor();
        self.initButton();
        self.setLayout();
    }

    override func viewWillAppear(animated: Bool) {
        var auth = SPTAuth.defaultInstance();
        
        if(auth.hasTokenRefreshService) {
            self.renewToken();
            return;
        }
    }
    
    func renewToken() {
        var auth = SPTAuth.defaultInstance();
        auth.renewSession(auth.session, callback: { (error, session) -> Void in
            auth.session = session;
            
            if (error != nil) {
                println("Error renewing session: \(error)");
                return;
            }
            self.navigationController?.popToRootViewControllerAnimated(true);
        })
        
    }
    
    func initButton() {
        loginButton = UIButton();
        loginButton!.backgroundColor = UIColor.greenColor();
        loginButton?.setTitle("Login With Spotify", forState: UIControlState.Normal);
        loginButton!.setTranslatesAutoresizingMaskIntoConstraints(false);
        view.addSubview(loginButton!);
    }
    
    func setLayout() {
        let loginViews = ["button" : loginButton, "bottom" : view];
        
        view.addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: loginButton, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0));
        view.addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: loginButton, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0));
    }
    
    func loginTapped() {
        authViewController = SPTAuthViewController.authenticationViewController();
        authViewController?.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext;
        authViewController?.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve;
        
        modalPresentationStyle = UIModalPresentationStyle.CurrentContext;
        definesPresentationContext = true;
        
        presentViewController(authViewController!, animated: false, completion: nil);
    }
    
    func didLoginWithSession(session :SPTSearch) -> SPTAuthViewController {
        
    }
    
    
}
