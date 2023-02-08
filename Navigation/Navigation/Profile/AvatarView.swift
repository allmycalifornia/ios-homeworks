//
//  AvatarView.swift
//  Navigation
//
//  Created by Борис Кравченко on 08.02.2023.
//

import UIKit

class AvatarView: UIImageView {

    func customize() {
        layer.cornerRadius = 50.0
        
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.white.cgColor
    }

}
