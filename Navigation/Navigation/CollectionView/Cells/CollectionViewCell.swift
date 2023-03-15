//
//  CollectionViewCell.swift
//  Navigation
//
//  Created by Борис Кравченко on 22.02.2023.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    var selectedImageView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupCell()
        //setupTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        self.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        
        NSLayoutConstraint.activate ([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
   
   
//    private let transLucentView: UIView = {
//        let view = UIView()
//        view.alpha = 0
//        view.backgroundColor = .black
//        view.frame = UIScreen.main.bounds
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    private lazy var closeProfileImageButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(systemName: "xmark"), for: .normal)
//        button.alpha = 0
//        button.tintColor = .white
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
//        return button
//    }()
//
//    @objc private func cancelAction() {
//        UIView.animateKeyframes(withDuration: 0.4, delay: 0, options: [.calculationModeCubicPaced], animations: {
//            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2) {
//                self.closeProfileImageButton.alpha = 0
//            }
//            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.8) {
////                self.collectionView.layer.cornerRadius = 50
//                self.topConstraintImage.constant = 16
//                self.leadingConstraintImage.constant = 16
//                self.widthConstraintImage.constant = 100
//                self.heightConstraintImage.constant = 100
//                self.transLucentView.alpha = 0
//                self.layoutIfNeeded()
//            }
//        }, completion: nil)
//    }
//
//    private var topConstraintImage = NSLayoutConstraint()
//    private var leadingConstraintImage = NSLayoutConstraint()
//    private var widthConstraintImage = NSLayoutConstraint()
//    private var heightConstraintImage = NSLayoutConstraint()
//
//    private func setupTapGesture() {
//            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
//        imageView.isUserInteractionEnabled = true
//        imageView.addGestureRecognizer(tapGesture)
//        }
//
//        @objc private func tapAction() {
//            bringSubviewToFront(imageView)
//            addSubview(transLucentView)
//            addSubview(closeProfileImageButton)
//
//
//
//
//            NSLayoutConstraint.activate([
//                closeProfileImageButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//                closeProfileImageButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
//                closeProfileImageButton.widthAnchor.constraint(equalToConstant: 40),
//                closeProfileImageButton.heightAnchor.constraint(equalToConstant: 40)
//            ])
//
//            UIView.animateKeyframes(withDuration: 0.5, delay: 0.0) {
//                self.transLucentView.alpha = 0.5
//                self.imageView.layer.cornerRadius = 0
//                self.topConstraintImage.constant = 100
//                self.leadingConstraintImage.constant = 0
//                self.widthConstraintImage.constant = UIScreen.main.bounds.width
//                self.heightConstraintImage.constant = UIScreen.main.bounds.width
//                self.layoutIfNeeded()
//            }
//            UIView.animateKeyframes(withDuration: 0.3, delay: 0.5) {
//                self.closeProfileImageButton.alpha = 1
//            }
//        }
    
    
}
