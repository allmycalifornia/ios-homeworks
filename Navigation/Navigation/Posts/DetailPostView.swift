//
//  DetailPostView.swift
//  Navigation
//
//  Created by Борис Кравченко on 14.03.2023.
//

import UIKit

//protocol MyCustomViewDelegate: AnyObject {
//    func changeText(_ text: String)
//}

final class DetailPostView: UIView {
    
    //weak var delegate: MyCustomViewDelegate?
    
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

    private let likesText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private let likesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "heart.fill")
        imageView.tintColor = .darkGray
        return imageView
    }()
    
    private let viewsText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private let viewsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "eye.fill")
        imageView.tintColor = .darkGray
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
        likesText.text = "Likes: \(post.likes)"
        viewsText.text = "Views: \(post.views)"
    }
    
    private func layout() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(authorText)
        contentView.addSubview(postImageView)
        contentView.addSubview(descriptionText)
        contentView.addSubview(likesText)
        contentView.addSubview(likesImageView)
        contentView.addSubview(viewsText)
        contentView.addSubview(viewsImageView)
        
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
            
            likesImageView.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: inset),
            likesImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            likesImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            likesImageView.heightAnchor.constraint(equalToConstant: inset),
            likesImageView.widthAnchor.constraint(equalToConstant: inset),
   
            likesText.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: inset),
            likesText.leadingAnchor.constraint(equalTo: likesImageView.trailingAnchor, constant: inset/3),
            likesText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
   
            viewsText.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: inset),
            viewsText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            viewsText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            
            viewsImageView.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: inset),
            viewsImageView.trailingAnchor.constraint(equalTo: viewsText.leadingAnchor, constant: -inset/3),
            viewsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            viewsImageView.heightAnchor.constraint(equalToConstant: inset),
            viewsImageView.widthAnchor.constraint(equalToConstant: inset),
        ])
    }
}


