//
//  LogInViewController.swift
//  Navigation
//
//  Created by Борис Кравченко on 14.02.2023.
//

import UIKit

final class LogInViewController: UIViewController {

    private let notification = NotificationCenter.default
    
    var email: String = "admin@admin.com"
    var password: String = "Admin123"
    
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.indent(size: 10)
        textField.textColor = .black
        textField.tintColor = myColor
        textField.font = .systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.placeholder = "Email or phone"
        textField.delegate = self
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemGray6
        textField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.indent(size: 10)
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.placeholder = "Password"
        textField.delegate = self
        textField.isSecureTextEntry = true
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemGray6
        textField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return textField
    }()
    
    private let passwordLenghtCheckLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.textColor = .red
        label.text = "Длина пароля не может быть меньше 8 символов"
        label.isHidden = true
        return label
    }()
    
    var loginButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        button.layer.masksToBounds = true
        return button
    }()
    
    func setLoginButtonStates() {
            switch loginButton.state {
            case .normal: loginButton.alpha = 1
            case .selected: loginButton.alpha = 0.8
            case .highlighted: loginButton.alpha = 0.8
            case .disabled: loginButton.alpha = 0.8
            default:
                break
            }
        }
    
    // Функция для показа анимации подергивания первого поля
    private func shakeAnimation() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: emailTextField.center.x - 10, y: emailTextField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: emailTextField.center.x + 10, y: emailTextField.center.y))

        emailTextField.layer.add(animation, forKey: "position")
    }
    
    // Функция для показа анимации подергивания второго поля
    private func shakeAnimation2() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: passwordTextField.center.x - 10, y: passwordTextField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: passwordTextField.center.x + 10, y: passwordTextField.center.y))

        passwordTextField.layer.add(animation, forKey: "position")
    }
    
    private func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(emailTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(passwordLenghtCheckLabel)
        contentView.addSubview(loginButton)
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            emailTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLenghtCheckLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 2),
            passwordLenghtCheckLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
        setLoginButtonStates()
        setupLoginButton()
        layout()
    }
    
    // метод добавления действия на кнопку Log In
    private func setupLoginButton() {
        loginButton.addTarget(self, action: #selector(tapLoginAction), for: .touchUpInside)
    }
    
    // метод перехода на страницу профиля с проверкой логина и пароля
    @objc private func tapLoginAction() {
        let profileVC = ProfileViewController()
        if emailTextField.text!.isEmpty {
            passwordLenghtCheckLabel.isHidden = false
            passwordLenghtCheckLabel.text = "Введите ваш email или телефон"
            shakeAnimation()
        } else if passwordTextField.text!.isEmpty {
            passwordLenghtCheckLabel.isHidden = false
            passwordLenghtCheckLabel.text = "Пароль не может быть пустым"
            shakeAnimation2()
        } else if emailTextField.text! != email {
            shakeAnimation()
        } else if passwordTextField.text!.count < 8 && emailTextField.text! == email {
            passwordLenghtCheckLabel.isHidden = false
            passwordLenghtCheckLabel.text = "Длина пароля должна быть не менее 8 символов"
            shakeAnimation2()
        } else if passwordTextField.text! != password && emailTextField.text! == email {
            passwordLenghtCheckLabel.text = "Пароль неверный"
            passwordTextField.text = ""
            shakeAnimation2()
        } else if emailTextField.text! == email && passwordTextField.text! == password {
            passwordLenghtCheckLabel.isHidden = true
            navigationController?.pushViewController(profileVC, animated: true)
        } else {
            ()
        }
    }
        
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notification.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardWillHideNotification)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keybordSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keybordSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
}
