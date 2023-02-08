//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Борис Кравченко on 07.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    
    private var avatarView = AvatarView(frame: CGRect(x: 16, y: 106, width: 100, height: 100))
    
        
        func setupProfileHeaderView() {
            addSubview(avatarView)
            
            avatarView.image = UIImage(named: "avatar.jpg")
            avatarView.customize()
        }
    }

