//
//  SpotifyUserSingleton.swift
//  SpotifyMonthly
//
//  Created by Katelyn Findlay on 8/13/15.
//  Copyright (c) 2015 Katelyn Findlay. All rights reserved.
//

import UIKit

class SpotifyUserSingleton {
   
//    static var userInst: SpotifyUserSingleton!
//    var profileVC: ProfileViewController?;
    var sptUser: SPTUser?;
    
    static let user: SpotifyUserSingleton = SpotifyUserSingleton();
    
    init() {
        println("Singleton Initialized");
    }
    
//    func handle(session :SPTSession, pvc :ProfileViewController) {
//        
//        SPTUser.requestCurrentUserWithAccessToken(session.accessToken, callback: { (error, object) -> Void in
//            if (error != nil) {
//                println("Cannot initialize user with access token error: \(error)")
//                return
//            }
//            
//            self.sptUser = object as? SPTUser;
//            
//            //profilevc reload
//            
//        })
//    }
}
