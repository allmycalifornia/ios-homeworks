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
        label.numberOfLines = 10
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
    
    private let likesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "heart.fill")
        imageView.tintColor = .darkGray
        return imageView
    }()
    
    private func likeGesture() {
        let likeGesture = UITapGestureRecognizer(target: self, action: #selector(tapLikeAction))
        likesImageView.isUserInteractionEnabled = true
        likesImageView.addGestureRecognizer(likeGesture)
        likesText.isUserInteractionEnabled = true
        likesText.addGestureRecognizer(likeGesture)
    }

    @objc private func tapLikeAction() {
        if likesImageView.tintColor == .red {
            likesImageView.tintColor = .gray
            viewsImageView.tintColor = .black
            if let likesText = likesText.text, let likes = Int(likesText.split(separator: " ")[1]) {
                self.likesText.text = "Likes: \(likes - 1)"
            }
        } else {
            likesImageView.tintColor = .red
            viewsImageView.tintColor = .black
            if let likesText = likesText.text, let likes = Int(likesText.split(separator: " ")[1]) {
                self.likesText.text = "Likes: \(likes + 1)"
            }
            if let viewsText = viewsText.text, let views = Int(viewsText.split(separator: " ")[1]) {
                self.viewsText.text = "Views: \(views + 1)"
            }
        }
        
        // Animate the change in the like and view counts
        UIView.animate(withDuration: 0.2, animations: {
            self.likesImageView.transform = CGAffineTransform(scaleX: 3, y: 3)
            //self.viewsImageView.transform = CGAffineTransform(scaleX: 3, y: 3)
        }, completion: { _ in
            UIView.animate(withDuration: 0.2, animations: {
                self.likesImageView.transform = CGAffineTransform.identity
                self.viewsImageView.transform = CGAffineTransform.identity
            })
        })
    }
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        likeGesture()
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
        [authorText, postImageView, descriptionText, likesText, likesImageView, viewsText, viewsImageView].forEach { contentView.addSubview($0) }
        contentView.layer.borderWidth = 0
        let inset: CGFloat = 16
        
        let screenWidth = UIScreen.main.bounds.width
        
        NSLayoutConstraint.activate([
            authorText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            authorText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            authorText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
       
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
