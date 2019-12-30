//
//  EditProfileViewController.swift
//  ProfilePageAppLatest
//
//  Created by Vibhor Gupta on 12/30/17.
//  Copyright © 2017 Vibhor Gupta. All rights reserved.
//

import UIKit

class EditProfileViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"

        view.addSubview(label)
        label.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        label.topAnchor.constraint(equalTo: self.view.topAnchor , constant : 100).isActive = true
        label.heightAnchor.constraint(equalToConstant : 60 ).isActive = true

    }


    let label : UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor.blue
        lb.text = "EDit Profile"
        lb.font = UIFont.systemFont(ofSize: 330)
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb


    }()
}
