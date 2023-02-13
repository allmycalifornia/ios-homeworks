//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Борис Кравченко on 01.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileHeaderView = ProfileHeaderView()
    
    private let newButton: UIButton = {
        var button = UIButton(type: .system)
        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("некая кнопка", for: .normal)  // в ДЗ воообще нет никаких описаний кнопки
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    func setupProfileViewController() {
        view.addSubview(profileHeaderView)
        view.addSubview(newButton)
        
        
        NSLayoutConstraint.activate([
            
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newButton.heightAnchor.constraint(equalToConstant: 50)
                ])
        }
        
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.frame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Мой профиль"
        //view.addSubview(profileHeaderView)
        profileHeaderView.setupProfileHeaderView()
        profileHeaderView.statusButtonChanger().addTarget(self, action: #selector(statusButtonPressed), for: .touchUpInside)
        //view.addSubview(newButton)
        setupProfileViewController()
    }
    
    @objc private func statusButtonPressed() {
        profileHeaderView.statusLabelChanger().text = profileHeaderView.statusTextFieldChanger().text
    }

}
