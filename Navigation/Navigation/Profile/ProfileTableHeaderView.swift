//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Борис Кравченко on 07.02.2023.
//

import UIKit

class ProfileTableHeaderView: UIView {
    
        // аватарка пользователя
        private let userImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "Pedro")
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
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Pedro Pascal"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
        }()
    
        // статус пользователя
        private lazy var userStatusLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Таков путь"
            label.textColor = .darkGray
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            return label
        }()
        
        // кнопка установки статуса пользователя
        private let showStatusButton: UIButton = {
            var button = UIButton(type: .system)
            button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Show status", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .systemBlue
            button.layer.shadowOffset = CGSize(width: 4, height: 4)
            button.layer.cornerRadius = 16
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.7
            button.addTarget(self, action: #selector(statusButtonPressed), for: .touchUpInside)
            return button
        }()
    
    @objc private func statusButtonPressed() {
        statusLabelChanger().text = statusTextFieldChanger().text
    }
    
    // поле для ввода статуса пользователя
    private let statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "This is the way"
        textField.indent(size: 10)
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        return textField
    }()
    
    // методы замены текста в строке статуса
    func statusButtonChanger() -> UIButton {
        showStatusButton
    }
    
    func statusLabelChanger() -> UILabel {
        userStatusLabel
    }

    func statusTextFieldChanger() -> UITextField {
        statusTextField
    }
    
    
    
      //сборка всех элементов для вывода на экран
    func setupProfileHeaderView() {
        backgroundColor = .lightGray
        addSubview(userImageView)
        addSubview(userNameLabel)
        addSubview(userStatusLabel)
        addSubview(statusTextField)
        addSubview(showStatusButton)
        
        
        // установка констрейнтов для всех элементов
        NSLayoutConstraint.activate([
            
            userImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            userImageView.heightAnchor.constraint(equalToConstant: 100),
            userImageView.widthAnchor.constraint(equalToConstant: 100),
            
            userNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 16),
            userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            userStatusLabel.topAnchor.constraint(equalTo: userNameLabel.topAnchor, constant: 30),
            userStatusLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 16),
            userStatusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            userStatusLabel.heightAnchor.constraint(equalToConstant: 20),

            statusTextField.topAnchor.constraint(equalTo: userStatusLabel.topAnchor, constant: 20),
            statusTextField.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            showStatusButton.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 16),
            showStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50)
                ])
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProfileHeaderView()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
    
