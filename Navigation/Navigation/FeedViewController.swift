//
//  FeedViewController.swift
//  Navigation
//
//  Created by Борис Кравченко on 01.02.2023.
//

import UIKit

final class FeedViewController: UIViewController {
    
    var post = Post(title: "Мой пост")
    
        private let viewPostButton: UIButton = {
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
        
    
        // установка кнопки по центру экрана
        private func setupButton() {
            view.addSubview(viewPostButton)
            viewPostButton.center = view.center
            viewPostButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        }

        // верхняя кнопка "Дальше"
        private func makeBarItem() {
            let barItem = UIBarButtonItem(title: "Дальше", style: .plain, target: self, action: #selector(barItemAction))
            navigationItem.rightBarButtonItem = barItem
        }
        
        // переход на экран "Профиль"
        @objc private func barItemAction() {
            let profileVC = ProfileViewController()
            profileVC.title = "Профиль"
            profileVC.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(profileVC, animated: true)
        }
    
    
    
        // метод действия кнопки
        @objc private func tapAction() {
            let postVC = PostViewController()
            postVC.titlePost = post.title
            navigationController?.pushViewController(postVC, animated: true)
        }
    
    
    
}


