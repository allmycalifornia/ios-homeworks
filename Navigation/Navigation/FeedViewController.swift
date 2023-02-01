//
//  FeedViewController.swift
//  Navigation
//
//  Created by Борис Кравченко on 01.02.2023.
//

import UIKit

final class FeedViewController: UIViewController {
        
        private let nextPageButton: UIButton = {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
            button.setTitle("Посмотреть пост", for: .normal)
            button.backgroundColor = .systemBlue
            return button
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            setupButton()
            makeBarItem()
        }
        
        private func setupButton() {
            view.addSubview(nextPageButton)
            nextPageButton.center = view.center
            nextPageButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        }
    
        //верхняя кнопка "Дальше"
        private func makeBarItem() {
            let barItem = UIBarButtonItem(title: "Дальше", style: .plain, target: self, action: #selector(barItemAction))
            navigationItem.rightBarButtonItem = barItem
        }
        
        @objc private func tapAction() {
            let postVC = PostViewController()
            postVC.title = "Пост"
            navigationController?.pushViewController(postVC, animated: true)
        }
        
        @objc private func barItemAction() {
            let profileVC = ProfileViewController()
            profileVC.title = "Профиль"
            profileVC.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(profileVC, animated: true)
        }
    }
