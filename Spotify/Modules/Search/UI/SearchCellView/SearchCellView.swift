//
//  SearchCellView.swift
//  Spotify
//
//  Created by Paul Matar on 03/12/2022.
//

import UIKit

final class SearchCellView: UIView {
    
    private lazy var imageView: AsyncImageView = {
        let iv = AsyncImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.alpha = 0.6
        return iv
    }()
    
    private lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 12, weight: .bold)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private lazy var followersLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 12)
        lbl.textAlignment = .justified
        return lbl
    }()
    
    private let ratingView = StarRatingView()

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutViews()
    }
    
    func configure(with model: ArtistModel) {
        let placeholder = UIImage(named: C.Images.placeholder)
        imageView.setImage(model.image, placeholder: placeholder)
        nameLabel.text = model.name
        followersLabel.text = model.followers
        ratingView.rating = model.rating
    }
    
    func resetImage() {
        imageView.image = nil
    }
    
    private func layoutViews() {
        imageView.place(on: self).pin(.allEdges)
        
        nameLabel.place(on: self).pin(
            .leading(padding: 3),
            .trailing(padding: 20),
            .top(padding: 3)
        )
        let stack = UIStackView(arrangedSubviews: [ratingView, followersLabel])
        stack.axis = .vertical
        stack.spacing = 3
        stack.place(on: self).pin(
            .leading(padding: 3),
            .bottom(padding: 3)
        )
    }
}
