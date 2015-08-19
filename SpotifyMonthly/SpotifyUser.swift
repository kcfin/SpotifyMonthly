//
//  SpotifyUser.swift
//  SpotifyMonthly
//
//  Created by Katelyn Findlay on 8/13/15.
//  Copyright (c) 2015 Katelyn Findlay. All rights reserved.
//

import UIKit

class SpotifyUser: NSObject {
    
    var session :SPTSession;
    var user :SPTUser;
    var pvc :ProfileViewController;
    
    init(session :SPTSession) {
        if(session != nil) {
            self.session = session;
        }
//
//        SPTReques
    }
    
}
