//
//  FeedTableHeaderView.swift
//  Navigation
//
//  Created by Борис Кравченко on 11.03.2023.
//

import UIKit

class FeedTableHeaderView: UIView {
    
        private let userImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.isUserInteractionEnabled = true
            imageView.image = UIImage(named: "Pedro")
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 15.0
            imageView.layer.borderWidth = 1
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.masksToBounds = true
        return imageView
        }()
    
        private let mainPageLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Главная"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
        }()
    
    private let addImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "plus.circle")
        imageView.tintColor = .black
        return imageView
    }()
    
    private let findImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = .black
        return imageView
    }()
    
    private let notificationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "bell")
        imageView.tintColor = .black
        return imageView
    }()
    
    private let newsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Новости"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    return label
    }()
    
    private let forYouLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Для вас"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    return label
    }()
    
    private let actuallyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Актуальное"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    return label
    }()
    

    func setupFeedHeaderView() {
        backgroundColor = .systemGray5
        addSubview(userImageView)
        addSubview(mainPageLabel)
        addSubview(addImageView)
        addSubview(findImageView)
        addSubview(notificationImageView)
        addSubview(newsLabel)
        addSubview(forYouLabel)
        addSubview(actuallyLabel)
        
        let inset: CGFloat = 16
        let insetImage: CGFloat = 30
        let insetImageMin: CGFloat = 25
        
        NSLayoutConstraint.activate([
            
            userImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: inset),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            userImageView.heightAnchor.constraint(equalToConstant: insetImage),
            userImageView.widthAnchor.constraint(equalToConstant: insetImage),
            
            mainPageLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            mainPageLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: inset),
            
            notificationImageView.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            notificationImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            notificationImageView.heightAnchor.constraint(equalToConstant: insetImageMin),
            notificationImageView.widthAnchor.constraint(equalToConstant: insetImageMin),
            
            findImageView.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            findImageView.trailingAnchor.constraint(equalTo: notificationImageView.leadingAnchor, constant: -inset),
            findImageView.heightAnchor.constraint(equalToConstant: insetImageMin),
            findImageView.widthAnchor.constraint(equalToConstant: insetImageMin),
            
            addImageView.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            addImageView.trailingAnchor.constraint(equalTo: findImageView.leadingAnchor, constant: -inset),
            addImageView.heightAnchor.constraint(equalToConstant: insetImageMin),
            addImageView.widthAnchor.constraint(equalToConstant: insetImageMin),
            
            newsLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: inset),
            newsLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: inset),
            
            forYouLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: inset),
            forYouLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            actuallyLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: inset),
            actuallyLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            ])
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFeedHeaderView()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
    
