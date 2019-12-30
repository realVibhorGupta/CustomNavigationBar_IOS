//
//  SideBarNavigationView.swift
//  ProfilePageAppLatest
//
//  Created by Vibhor Gupta on 12/30/17.
//  Copyright © 2017 Vibhor Gupta. All rights reserved.
//

import UIKit

class SideBarNavigationView : UIView,UITableViewDelegate , UITableViewDataSource{



    let cellId = "cellId"
    var sidebarTitles = [String]()

    //below  varaible will tell which item is clicked
    weak var delegate : SideBarNavigationDrawerDelegate?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sidebarTitles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.selectionStyle = .gray
        if indexPath.row == 0 {

            let profileImageView  : UIImageView!
            profileImageView = UIImageView(frame: CGRect(x: 15, y: 10, width: 80, height: 80))
            profileImageView.layer.cornerRadius = 40
            profileImageView.layer.masksToBounds = true
            profileImageView.contentMode = .scaleAspectFill
            cell.addSubview(profileImageView)

            let cellLabel = UILabel(frame : CGRect(x: 110, y: cell.frame.height/2 - 15 , width: 250, height: 30))
            cell.addSubview(cellLabel)
            cellLabel.text = sidebarTitles[indexPath.row]
            cellLabel.font = UIFont.systemFont(ofSize: 17)
            cellLabel.textColor = UIColor.blue


        }else{

            cell.textLabel?.text = sidebarTitles[indexPath.row]
            cell.textLabel?.textColor = UIColor.brown
        }


        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.delegate?.sideBarNavigationDrawerDidSelectRow(row: Row(row: indexPath.row))
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100

        }else {
            return 60
        }

    }


    override init(frame: CGRect) {
        super.init(frame: frame)

        self.clipsToBounds = true
        sidebarTitles = ["Name" ,
                         "Phone NUmber" ,
                         "Tell Your Friend" ,
                         "Email Us",
                         "Help and Feedback",
                         "Terms and Privacy Policy",
                         "About Us",
                         "FAQ",
                         "Made with ❤️ in India"

        ]


        setUpNavigationView()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = UIColor.clear
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = true
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none



    }




    private func setUpNavigationView(){
        addSubview(tableView)

        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

    }





    let tableView : UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }




}

protocol SideBarNavigationDrawerDelegate : class {

    func sideBarNavigationDrawerDidSelectRow(row: Row)
}


enum Row : String {
    case editProfile
    case name
    case phoneNumber
    case tellYourFriend
    case emailUs
    case helpAndFeedBack
    case termsAndConditions
    case aboutUs
    case faq
    case none

    init(row : Int) {
        switch row {
        case 0 : self = .editProfile
        case 1 : self = .name
        case 2 : self = .phoneNumber
        case 3 : self = .tellYourFriend
        case 4 : self = .emailUs
        case 5 : self = .helpAndFeedBack
        case 6 : self = .termsAndConditions
        case 7: self = .aboutUs
        case 8 : self = .faq
        default : self = .none

        }
    }
}
































