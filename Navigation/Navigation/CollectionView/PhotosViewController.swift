//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Борис Кравченко on 22.02.2023.
//

import UIKit

final class PhotosViewController: UIViewController {
    
    let source: [Gallery] = Source.randomPhotos(with: 50)
    
    private let notification = NotificationCenter.default
    
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

extension PhotosViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        let imageView = UIImageView(image: cell.imageView.image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = cell.imageView.convert(cell.imageView.bounds, to: view)
        view.addSubview(imageView)

        let backgroundView = UIView(frame: view.bounds)
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        backgroundView.alpha = 0
        view.addSubview(backgroundView)
        view.bringSubviewToFront(imageView)

        let closeButton = UIButton(type: .custom)
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        closeButton.tintColor = .white
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(closeButton)

        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 44),
            closeButton.heightAnchor.constraint(equalToConstant: 44)
        ])

        UIView.animate(withDuration: 0.3) {
            imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width)
            imageView.center = self.view.center
            backgroundView.alpha = 1
        }
    }

    @objc private func closeButtonTapped() {
        if let imageView = view.subviews.first(where: { $0 is UIImageView }) {
            UIView.animate(withDuration: 0.3, animations: {
                imageView.frame = (imageView.superview?.convert(self.view.frame, to: imageView))!
            }, completion: { finished in
                imageView.removeFromSuperview()
            })
        }

        if let backgroundView = view.subviews.first(where: { $0.backgroundColor == UIColor.black.withAlphaComponent(0.5) }) {
            UIView.animate(withDuration: 0.3, animations: {
                backgroundView.alpha = 0
            }, completion: { finished in
                backgroundView.removeFromSuperview()
            })
        }
    }
}

