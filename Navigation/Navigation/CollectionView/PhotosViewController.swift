//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Борис Кравченко on 22.02.2023.
//

import UIKit

final class PhotosViewController: UIViewController {
    
    let source: [Gallery] = Source.randomPhotos(with: 20)
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Photos Gallery"
        layout()
        showNavigationBar()
        setupCollectionView()
        setupTapGesture()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        }
    
    private func layout() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    private let transLucentView: UIView = {
        let view = UIView()
        view.alpha = 0
        view.backgroundColor = .black
//        view.backgroundColor = .white
        view.frame = UIScreen.main.bounds
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    

    private lazy var closeProfileImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.alpha = 0
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        return button
    }()

    @objc private func cancelAction() {
        UIView.animateKeyframes(withDuration: 0.4, delay: 0, options: [.calculationModeCubicPaced], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2) {
                self.closeProfileImageButton.alpha = 0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.8) {
//                self.collectionView.layer.cornerRadius = 50
                self.topConstraintImage.constant = 150
                self.leadingConstraintImage.constant = 150
                self.widthConstraintImage.constant = 100
                self.heightConstraintImage.constant = 100
                self.transLucentView.alpha = 0
                //self.layoutIfNeeded()
            }
        }, completion: nil)
    }
    
    private var topConstraintImage = NSLayoutConstraint()
    private var leadingConstraintImage = NSLayoutConstraint()
    private var widthConstraintImage = NSLayoutConstraint()
    private var heightConstraintImage = NSLayoutConstraint()
    
    private func setupTapGesture() {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        collectionView.isUserInteractionEnabled = true
        collectionView.addGestureRecognizer(tapGesture)
        }

        @objc private func tapAction() {
            view.bringSubviewToFront(collectionView)
            view.addSubview(transLucentView)
            view.addSubview(closeProfileImageButton)
            
            
            
            NSLayoutConstraint.activate([
                closeProfileImageButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                closeProfileImageButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
                closeProfileImageButton.widthAnchor.constraint(equalToConstant: 40),
                closeProfileImageButton.heightAnchor.constraint(equalToConstant: 40)
            ])

            UIView.animateKeyframes(withDuration: 0.5, delay: 0.0) {
                self.transLucentView.alpha = 0.5
                self.collectionView.layer.cornerRadius = 0
                self.topConstraintImage.constant = 100
                self.leadingConstraintImage.constant = 0
                self.widthConstraintImage.constant = UIScreen.main.bounds.width
                self.heightConstraintImage.constant = UIScreen.main.bounds.width
                //self.layoutIfNeeded()
            }
            UIView.animateKeyframes(withDuration: 0.3, delay: 0.5) {
                self.closeProfileImageButton.alpha = 1
            }
        }
    
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupCell()
        cell.imageView.image = UIImage(named: source[indexPath.item].imageName)
        return cell
    }
    
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 8 }
    private var elementCount: CGFloat { return 3}
    private var insetsCount: CGFloat { return elementCount + 1}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width  = (collectionView.bounds.width - sideInset * insetsCount) / elementCount
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: .zero, right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
}
