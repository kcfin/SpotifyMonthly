//
//  AppDelegate.swift
//  SpotifyMonthly
//
//  Created by Katelyn Findlay on 8/13/15.
//  Copyright (c) 2015 Katelyn Findlay. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let kClientId = "3d912a8a1aa64b11b07abeecc30df390"
    let kCallbackURL = "spotify-monthly-login://callback"
    
    var session:SPTSession?
    var player:SPTAudioStreamingController?
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds);
        window!.makeKeyAndVisible();
        
        let profileVC = ProfileViewController();
        let navVC = UINavigationController(rootViewController: profileVC);
        navVC.navigationBarHidden = true;
        navVC.navigationBar.topItem?.title = ("Spotify Monthly");
        
        window!.rootViewController = navVC;
        
        var auth = SPTAuth.defaultInstance();
        auth.clientID = kClientId;
        auth.requestedScopes = [SPTAuthStreamingScope];
        auth.redirectURL = NSURL(string: kCallbackURL);
        
        var loginURl = auth.loginURL;
        
        
        
        if(auth.session == nil || !auth.session.isValid()){
            navVC.pushViewController(LoginViewController(), animated: true);
        } else {
            SpotifyUserSingleton.user.handle(auth.session, pvc: profileVC);
        }
        
        return true
    }

    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        if(SPTAuth.defaultInstance().canHandleURL(url)) {
            SPTAuth.defaultInstance().handleAuthCallbackWithTriggeredAuthURL(url, callback: { (error, session) -> Void in
                if (error != nil) {
                    println("*** Auth error: \(error)")
                    return
                }
                
//                self.playUsingSession(session)
                
            })
            return true;
        }
        return false;
    }
    
//    func playUsingSession(session: SPTSession) {
//        
//        if(player == nil) {
//            player = SPTAudioStreamingController(clientId: kClientId);
//        }
//        
//        player!.loginWithSession(session, callback: { (error) -> Void in
//            if (error != nil) {
//                println("*** Login error: \(error)")
//                return
//            }
//            
//            let spotifyURI = "spotify:track:58s6EuEYJdlb0kO7awm3Vp";
//            self.player!.playURIs([NSURL(string: spotifyURI)!], withOptions: nil, callback: nil);
//        })
//    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

