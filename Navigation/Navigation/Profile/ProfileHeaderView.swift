//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Борис Кравченко on 07.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
        // аватарка пользователя
        private let userImageView: UIImageView = {
            let imageView = UIImageView(frame: CGRect(x: 16, y: 106, width: 100, height: 100))
            imageView.backgroundColor = .red
            imageView.image = UIImage(named: "avatar")
            imageView.contentMode = .scaleAspectFill
            imageView.backgroundColor = .black
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 50.0
            imageView.layer.borderWidth = 3.0
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.masksToBounds = true
        return imageView
        }()
    
        // имя пользователя
        private let userNameLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 132, y: 117, width: 200, height: 20))
            label.text = "Rumi Hiiragi"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
        }()
    
        // статус пользователя
        private lazy var userStatusLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 132, y: 146, width: 200, height: 20))
            label.text = "Waiting for something..."
            label.textColor = .darkGray
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            return label
        }()
        
        // кнопка установки статуса пользователя
        private let showStatusButton: UIButton = {
            var button = UIButton(type: .system)
            button = UIButton(frame: CGRect(x: 16, y: 220, width: 358, height: 50))
            button.setTitle("Show status", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .systemBlue
            button.layer.shadowOffset = CGSize(width: 4, height: 4)
            button.layer.cornerRadius = 16   // в задании написано 4, но на макете углы гораздо более скруглённые
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.7
            //button.addTarget(ProfileHeaderView.self, action: #selector(statusButtonAction), for: .touchUpInside)  - убрал в коммент из-за задания со звёздочкой
            return button
        }()
    
    // поле для ввода статуса пользователя
    private let statusTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 132, y: 170, width: 242, height: 40))
        textField.placeholder = " Введите статус"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        return textField
    }()
    
    func statusButtonChanger() -> UIButton {
        showStatusButton
    }
    
    func statusLabelChanger() -> UILabel {
        userStatusLabel
    }
    
    func statusTextFieldChanger() -> UITextField {
        statusTextField
    }
    
    // сборка всех элементов для вывода на экран
    func setupProfileHeaderView() {
        addSubview(userImageView)
        addSubview(userNameLabel)
        addSubview(userStatusLabel)
        addSubview(statusTextField)
        addSubview(showStatusButton)
    }
    
    override init(frame: CGRect) {
           super.init (frame: .zero)
           setupProfileHeaderView()
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

