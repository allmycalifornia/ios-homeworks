//
//  LogInViewController.swift
//  Navigation
//
//  Created by Борис Кравченко on 14.02.2023.
//

import UIKit

final class LogInViewController: UIViewController {

    private let notification = NotificationCenter.default
    //private let loginView = LoginView()
    
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
    
    
    private lazy var textField1: UITextField = {
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
    
    private lazy var textField2: UITextField = {
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
    
//    init(frame: CGRect) {
//        super.init(frame: frame)
//        view.backgroundColor = .white
//        layout()
//        setLoginButtonStates()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    private func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(textField1)
        contentView.addSubview(textField2)
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
            
            textField1.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            textField1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textField1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textField1.heightAnchor.constraint(equalToConstant: 50),
            
            textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor),
            textField2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textField2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textField2.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
        layout()
        setLoginButtonStates()
        setupLoginButton()
    }
    
    // метод добавления действия на кнопку Log In
    private func setupLoginButton() {
        loginButton.addTarget(self, action: #selector(tapLoginAction), for: .touchUpInside)
    }
    
    // метод перехода на страницу профиля
    @objc private func tapLoginAction() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
        
//        let photosVC = PhotosViewController()
//        navigationController?.pushViewController(photosVC, animated: true)
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
