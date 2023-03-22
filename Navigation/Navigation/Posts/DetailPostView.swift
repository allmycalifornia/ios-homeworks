//
//  DetailPostView.swift
//  Navigation
//
//  Created by Борис Кравченко on 14.03.2023.
//

import UIKit

final class DetailPostView: UIView {
    
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
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
        return imageView
    }()
    
    private let authorText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .darkText
        return label
    }()
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .justified
        label.textColor = .black
        return label
    }()
    
        private let swipeDownText: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 1
            label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
            label.textColor = .systemGray2
            label.text = "Смахните вниз для возврата в ленту"
            return label
        }()
    
        private let swipeDownImage: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.image = UIImage(systemName: "chevron.down")
            imageView.tintColor = .systemGray4
            return imageView
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(post: Post) {
        authorText.text = post.author
        postImageView.image = post.image
        descriptionText.text = post.description
    }
    
    private func layout() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(authorText)
        contentView.addSubview(postImageView)
        contentView.addSubview(descriptionText)
        contentView.addSubview(swipeDownText)
        contentView.addSubview(swipeDownImage)
        
        let inset: CGFloat = 16
        let screenWidth = UIScreen.main.bounds.width
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            authorText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            authorText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
       
            postImageView.topAnchor.constraint(equalTo: authorText.bottomAnchor, constant: inset),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -0.5),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0.5),
            postImageView.heightAnchor.constraint(equalToConstant: screenWidth*0.75),
   
            descriptionText.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: inset),
            descriptionText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            descriptionText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            
            swipeDownText.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: inset),
            swipeDownText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            swipeDownImage.topAnchor.constraint(equalTo: swipeDownText.bottomAnchor, constant: inset/8),
            swipeDownImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            swipeDownImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}


