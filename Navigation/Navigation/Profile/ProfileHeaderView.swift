//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Борис Кравченко on 07.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    
    class UserImageView: UIImageView {
        private let userImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.backgroundColor = .red
            imageView.image = UIImage(named: "avatar")
            imageView.contentMode = .scaleAspectFill
            imageView.backgroundColor = .black
            imageView.clipsToBounds = true
        return imageView
        }()
        
        func customize() {
            layer.cornerRadius = 50.0
            layer.borderWidth = 3.0
            layer.borderColor = UIColor.white.cgColor
            layer.masksToBounds = true
        }
    }
    
    
    class UserNameLabel: UILabel {
        private let userNameLabel: UILabel = {
            let label = UILabel()
            label.text = "Rumi Hiiragi"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
        }()
    }
    
    
    class UserStatusLabel: UILabel {
        private let userStatusLabel: UILabel = {
            let label = UILabel()
            label.text = "Waiting for something..."
            label.textColor = .gray
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            return label
        }()
    }
    
    
    class ShowStatusButton: UIButton {
        private let showStatusButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Show status", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .systemBlue
            button.layer.shadowOffset = CGSize(width: 4, height: 4)
            button.layer.cornerRadius = 4
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.7
            return button
        }()
    }
    
    
    private let userImageView = UserImageView(frame: CGRect(x: 16, y: 106, width: 100, height: 100))
    private let userNameLabel = UserNameLabel(frame: CGRect(x: 132, y: 117, width: 150, height: 20))
    private let userStatusLabel = UserStatusLabel(frame: CGRect(x: 132, y: 195, width: 150, height: 20))
    private let showStatusButton = ShowStatusButton(frame: CGRect(x: 50, y: 50, width: 200, height: 50))
    
    func setupProfileHeaderView() {
        addSubview(userImageView)
        userImageView.customize()
        addSubview(userNameLabel)
        addSubview(userStatusLabel)
        addSubview(showStatusButton)
    }
    
//    init() {
//        super.init (frame: .zero)
//        setupProfileHeaderView()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProfileHeaderView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

