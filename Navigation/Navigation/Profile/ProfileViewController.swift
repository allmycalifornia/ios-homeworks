//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Борис Кравченко on 01.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewWillLayoutSubviews() {
    profileHeaderView.frame = self.view.frame
    }
    
    private let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        self.title = "Мой профиль"
        profileHeaderView.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        profileHeaderView.setupProfileHeaderView()
        
    }
    
    
    

}
