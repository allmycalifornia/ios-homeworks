//
//  CustomCellTableViewCell.swift
//  Navigation
//
//  Created by Борис Кравченко on 17.02.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.systemGray.cgColor
        return imageView
    }()
    
    private let authorText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .darkText
        return label
    }()
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
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
    
    private let viewsText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        viewsText.text = "Viewa: \(post.views)"
    }
    
    private func layout() {
        [authorText, postImageView, descriptionText, likesText, viewsText].forEach { contentView.addSubview($0) }
        contentView.backgroundColor = .systemGray5
        contentView.layer.borderWidth = 0
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            authorText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            authorText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            authorText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
        ])
        
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: authorText.bottomAnchor, constant: inset),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -0.5),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0.5),
            postImageView.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        NSLayoutConstraint.activate([
            descriptionText.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: inset),
            descriptionText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            descriptionText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
        ])
        
        NSLayoutConstraint.activate([
            likesText.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: inset),
            likesText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            likesText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
        ])
        
        NSLayoutConstraint.activate([
            viewsText.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: inset),
            viewsText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            viewsText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
        ])
    }

    
    
}

//    private let contentWhiteView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    private let postImage: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.backgroundColor = .black
//        image.contentMode = .scaleAspectFit
//        image.clipsToBounds = true
//        return image
//    }()
//
//    private let postAuthor: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .white
//        label.textColor = .black
//        label.font = .systemFont(ofSize: 20, weight: .bold)
//        label.backgroundColor = .white
//        label.numberOfLines = 2
//        return label
//    }()
//
//    private let postDescriptionText: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = .systemGray
//        label.font = .systemFont(ofSize: 14)
//        label.backgroundColor = .white
//        label.numberOfLines = 0
//        return label
//    }()
//
//    private let postLikes: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .white
//        label.textColor = .black
//        label.font = .systemFont(ofSize: 16)
//        return label
//    }()
//
//    private let postViews: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .white
//        return label
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        customizeCell()
//        layout()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setupCell(feed: Posts) {
//        postImage.image = feed.image
//        postAuthor.text = feed.author
//        postDescriptionText.text = feed.description
//        postLikes.text = String(feed.likes)
//        postViews.text = String(feed.views)
//    }
//
//    private func customizeCell() {
//        contentWhiteView.backgroundColor = .systemGray6
//        contentWhiteView.layer.cornerRadius = 10
//        contentWhiteView.layer.borderWidth = 1
//        contentWhiteView.layer.borderColor = UIColor.black.cgColor
//    }
//
//    private func layout() {
//        [contentWhiteView, postImage, postAuthor, postDescriptionText, postLikes, postViews].forEach { contentView.addSubview($0) }
//
//        let viewInset: CGFloat = 8
//        let screenWidth = UIScreen.main.bounds.width
//
//        NSLayoutConstraint.activate([
//            contentWhiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: viewInset),
//            contentWhiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset),
//            contentWhiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -viewInset),
//            contentWhiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset),
//        ])
//
//        NSLayoutConstraint.activate([
//            postAuthor.topAnchor.constraint(equalTo: contentView.topAnchor),
//            postAuthor.leadingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: 16),
//            postAuthor.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -16),
//            postAuthor.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -16)
//        ])
//
//        NSLayoutConstraint.activate([
//            postImage.topAnchor.constraint(equalTo: postAuthor.topAnchor, constant: 16),
//            postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            postImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            postImage.heightAnchor.constraint(equalToConstant: screenWidth),
//            postImage.widthAnchor.constraint(equalToConstant: screenWidth),
//            postImage.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -16)
//        ])
//
//        NSLayoutConstraint.activate([
//            postDescriptionText.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
//            postDescriptionText.leadingAnchor.constraint(equalTo: postAuthor.leadingAnchor),
//            postDescriptionText.trailingAnchor.constraint(equalTo: postAuthor.trailingAnchor),
//            postDescriptionText.bottomAnchor.constraint(equalTo: postLikes.bottomAnchor, constant: -16)
//        ])
//
//        NSLayoutConstraint.activate([
//            postLikes.topAnchor.constraint(equalTo: postDescriptionText.bottomAnchor, constant: 16),
//            postLikes.leadingAnchor.constraint(equalTo: postAuthor.leadingAnchor),
//            postLikes.trailingAnchor.constraint(equalTo: postAuthor.centerXAnchor),
//            postLikes.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -16)
//        ])
//
//        NSLayoutConstraint.activate([
//            postViews.topAnchor.constraint(equalTo: postDescriptionText.bottomAnchor, constant: 16),
//            postViews.leadingAnchor.constraint(equalTo: postAuthor.centerXAnchor),
//            postViews.trailingAnchor.constraint(equalTo: postAuthor.trailingAnchor),
//            postViews.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -16)
//        ])
//    }
//}
//
