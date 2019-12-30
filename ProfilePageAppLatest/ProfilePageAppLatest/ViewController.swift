//
//  ViewController.swift
//  ProfilePageAppLatest
//
//  Created by Vibhor Gupta on 12/30/17.
//  Copyright © 2017 Vibhor Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var sideBarNavigationView : SideBarNavigationView!
    var backSreen : UIView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        title = "Home"
        let leftMenuButton = UIBarButtonItem(image: #imageLiteral(resourceName: "Image"), style: .plain, target: self, action: #selector(handleMenuBarButton))
        leftMenuButton.tintColor = UIColor(red: 54/255, green: 55/255, blue: 56/255, alpha: 1.0)
        self.navigationItem.leftBarButtonItem = leftMenuButton


        sideBarNavigationView = SideBarNavigationView(frame: CGRect(x: 0, y: 0, width: 0, height: self.view.frame.height))
        sideBarNavigationView.delegate = (self as? SideBarNavigationDrawerDelegate)
        sideBarNavigationView.layer.zPosition = 100
        self.view.isUserInteractionEnabled = true
        self.navigationController?.view.addSubview(sideBarNavigationView)

        backSreen=UIView(frame: self.view.bounds)
        backSreen.backgroundColor = UIColor(white: 0, alpha: 0.5)
        backSreen.isHidden =  true
        self.navigationController?.view.addSubview(backSreen)
        backSreen.layer.zPosition = 99
        let tapGestureRecognizer = UIGestureRecognizer(target: self, action: #selector(handleBackScreenTap(sender :)))
        backSreen.addGestureRecognizer(tapGestureRecognizer)

    }
    @objc private func handleMenuBarButton(){

        backSreen.isHidden = false
        UIView.animate(withDuration: 0.5, animations: {
            self.sideBarNavigationView.frame = CGRect(x: 0, y: 0, width: 250, height: self.sideBarNavigationView.frame.height )
        }){ (complete) in


            self.backSreen.frame=CGRect(x: self.sideBarNavigationView.frame.width, y: 0, width: self.view.frame.width-self.sideBarNavigationView.frame.width, height: self.view.bounds.height+100)

        }
    }

    @objc private func handleBackScreenTap(sender : UITapGestureRecognizer){
        backSreen.isHidden = true
        backSreen.frame = self.view.bounds
        UIView.animate(withDuration: 0.5) {
            self.sideBarNavigationView.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.frame.height)
        }
    }

}
extension ViewController : SideBarNavigationDrawerDelegate {

    func sideBarNavigationDrawerDidSelectRow(row: Row) {
        print("row : \(row)" )
        backSreen.isHidden = true
        backSreen.frame = self.view.bounds
        UIView.animate(withDuration: 0.5) {
            self.sideBarNavigationView.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.frame.height)
        }

        switch row {

        case .editProfile :
            let vc = EditProfileViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .name : break
            
        case  .phoneNumber : break
        case .tellYourFriend : break
        case .emailUs : break
        case .helpAndFeedBack : break
        case .termsAndConditions : break
        case  .aboutUs : break
        case  .faq :
            break
        case .none:
            break
        }

    }
}

































