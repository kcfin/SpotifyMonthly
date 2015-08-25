//
//  HomeViewController.swift
//  SpotifyMonthly
//
//  Created by Katelyn Findlay on 8/24/15.
//  Copyright (c) 2015 Katelyn Findlay. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

//    var playlistVC :UITableViewController!;
    var profileView :UIView!;
    var pictureView :UIImageView!;
    var nameLabel :UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor();
        setupProfileView();
        setupNameLabel();
        setupPhotoView();
        setupLayoutConstraints();

    }
    
    func setupProfileView() {
        profileView = UIView();
        profileView.backgroundColor = UIColor.grayColor();
        profileView.setTranslatesAutoresizingMaskIntoConstraints(false);
        
        view.addSubview(profileView);
    }
    
    func setupNameLabel() {
        nameLabel = UILabel();
        nameLabel.text = "Kate";
        nameLabel.textColor = UIColor.greenColor();
        nameLabel.font = UIFont.systemFontOfSize(30);
        nameLabel.setTranslatesAutoresizingMaskIntoConstraints(false);
        
        profileView.addSubview(nameLabel);
    }
    
    func setupPhotoView() {
        pictureView = UIImageView();
        pictureView.backgroundColor = UIColor.whiteColor();
        pictureView.layer.borderColor = UIColor.greenColor().CGColor;
        pictureView.layer.borderWidth = 3.0;
        pictureView.layer.cornerRadius = 50;
        pictureView.layer.masksToBounds = true;
        pictureView.contentMode = UIViewContentMode.ScaleAspectFill;
        pictureView.setTranslatesAutoresizingMaskIntoConstraints(false);
        
        profileView.addSubview(pictureView);
    }
    
//    func setupTableView() {
//        
//    }
    
    func setupLayoutConstraints() {
        let homeViews = ["profileView" : profileView, "pictureView" : pictureView, "nameLabel" : nameLabel];
        
        profileView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[pictureView(100)]-[nameLabel]", options: NSLayoutFormatOptions(0), metrics: nil, views: homeViews));
        profileView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[pictureView(100)]", options: NSLayoutFormatOptions(0), metrics: nil, views: homeViews));
        profileView.addConstraint(NSLayoutConstraint(item: profileView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: pictureView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0));
        profileView.addConstraint(NSLayoutConstraint(item: profileView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: pictureView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0));
        profileView.addConstraint(NSLayoutConstraint(item: profileView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: nameLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0));
        
        view.addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: profileView, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0));
        view.addConstraint(NSLayoutConstraint(item: profileView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Height, multiplier: 0.5, constant: 0));
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[profileView]", options: NSLayoutFormatOptions(0), metrics: nil, views: homeViews));
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[profileView]|", options: NSLayoutFormatOptions(0), metrics: nil, views: homeViews));

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
