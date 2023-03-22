//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Борис Кравченко on 07.02.2023.
//

import UIKit

class ProfileTableHeaderView: UIView {
    
    // аватарка пользователя
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
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
    
    // Функция для показа анимации подергивания поля установки статуса
       private func shakeAnimationForStatusTextField() {
           let animation = CABasicAnimation(keyPath: "position")
           animation.duration = 0.07
           animation.repeatCount = 4
           animation.autoreverses = true
           animation.fromValue = NSValue(cgPoint: CGPoint(x: statusTextField.center.x - 10, y: statusTextField.center.y))
           animation.toValue = NSValue(cgPoint: CGPoint(x: statusTextField.center.x + 10, y: statusTextField.center.y))

           statusTextField.layer.add(animation, forKey: "position")
       }
    
    
    @objc private func statusButtonPressed() {
        if statusTextField.text!.isEmpty {
            shakeAnimationForStatusTextField()
        } else {
            statusLabelChanger().text = statusTextFieldChanger().text
            statusTextField.text = ""
        }
    }
    
    // поле для ввода статуса пользователя
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Введите новый статус"
        textField.indent(size: 10)
        textField.delegate = self
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .gray
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
    
    private let transLucentView: UIView = {
        let view = UIView()
        view.alpha = 0
        view.backgroundColor = .black
        view.frame = UIScreen.main.bounds
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var closeProfileImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.alpha = 0
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        return button
    }()

    @objc
    private func cancelAction() {
        UIView.animateKeyframes(withDuration: 0.4, delay: 0, options: [.calculationModeCubicPaced], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2) {
                self.closeProfileImageButton.alpha = 0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.8) {
                self.userImageView.layer.cornerRadius = 50
                self.userImageView.layer.borderWidth = 3
                self.topConstraintImage.constant = 16
                self.leadingConstraintImage.constant = 16
                self.widthConstraintImage.constant = 100
                self.heightConstraintImage.constant = 100
                self.transLucentView.alpha = 0
                self.layoutIfNeeded()
            }
        }, completion: nil)
    }
    
    //сборка всех элементов для вывода на экран
    func setupProfileHeaderView() {
        backgroundColor = .lightGray
        addSubview(userImageView)
        addSubview(userNameLabel)
        addSubview(userStatusLabel)
        addSubview(statusTextField)
        addSubview(showStatusButton)
    }
    
    private var topConstraintImage = NSLayoutConstraint()
    private var leadingConstraintImage = NSLayoutConstraint()
    private var widthConstraintImage = NSLayoutConstraint()
    private var heightConstraintImage = NSLayoutConstraint()
    
    // установка констрейнтов для всех элементов
    private func setConstraints() {
        
        topConstraintImage = userImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        leadingConstraintImage = userImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16)
        widthConstraintImage = userImageView.widthAnchor.constraint(equalToConstant: 100)
        heightConstraintImage = userImageView.heightAnchor.constraint(equalToConstant: 100)

            NSLayoutConstraint.activate([
                topConstraintImage,
                leadingConstraintImage,
                widthConstraintImage,
                heightConstraintImage,

                userNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
                userNameLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 130),
                userNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),


                userStatusLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 16),
                userStatusLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
                userStatusLabel.trailingAnchor.constraint(equalTo:userNameLabel.trailingAnchor),


                statusTextField.topAnchor.constraint(equalTo: userStatusLabel.bottomAnchor, constant: 8),
                statusTextField.leadingAnchor.constraint(equalTo: userStatusLabel.leadingAnchor),
                statusTextField.trailingAnchor.constraint(equalTo: userStatusLabel.trailingAnchor),
                statusTextField.heightAnchor.constraint(equalToConstant: 40),


                showStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
                showStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                showStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                showStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
                showStatusButton.heightAnchor.constraint(equalToConstant: 50),
            ])
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        userImageView.isUserInteractionEnabled = true
        userImageView.addGestureRecognizer(tapGesture)
    }

    @objc private func tapAction() {
        addSubview(transLucentView)
        addSubview(closeProfileImageButton)
        bringSubviewToFront(userImageView)

        NSLayoutConstraint.activate([
            closeProfileImageButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            closeProfileImageButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            closeProfileImageButton.widthAnchor.constraint(equalToConstant: 30),
            closeProfileImageButton.heightAnchor.constraint(equalToConstant: 30)
        ])

        UIView.animateKeyframes(withDuration: 0.5, delay: 0.0) {
            self.transLucentView.alpha = 0.7
            self.userImageView.layer.cornerRadius = 0
            self.userImageView.layer.borderWidth = 7
            self.topConstraintImage.constant = 100
            self.leadingConstraintImage.constant = 0
            self.widthConstraintImage.constant = UIScreen.main.bounds.width
            self.heightConstraintImage.constant = UIScreen.main.bounds.width
            self.layoutIfNeeded()
        }
        UIView.animateKeyframes(withDuration: 0.3, delay: 0.5) {
            self.closeProfileImageButton.alpha = 1
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProfileHeaderView()
        setConstraints()
        setupTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    

