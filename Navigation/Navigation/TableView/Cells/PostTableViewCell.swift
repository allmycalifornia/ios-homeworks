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
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.systemGray.cgColor
        imageView.backgroundColor = .black
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
        label.textColor = .systemGray
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
        viewsText.text = "Views: \(post.views)"
    }
    
    private func layout() {
        [authorText, postImageView, descriptionText, likesText, viewsText].forEach { contentView.addSubview($0) }
        //contentView.backgroundColor = .systemGray5
        contentView.layer.borderWidth = 0
        let inset: CGFloat = 16
        
        let screenWidth = UIScreen.main.bounds.width
        
        NSLayoutConstraint.activate([
            authorText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            authorText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            authorText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
        ])
        
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: authorText.bottomAnchor, constant: inset),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -0.5),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0.5),
            postImageView.heightAnchor.constraint(equalToConstant: screenWidth),
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
