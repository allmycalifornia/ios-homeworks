//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Борис Кравченко on 01.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileHeaderView = ProfileHeaderView()
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.frame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Мой профиль"
        view.addSubview(profileHeaderView)
        profileHeaderView.backgroundColor = .lightGray
        profileHeaderView.setupProfileHeaderView()
        
    }
        
    
    

}
