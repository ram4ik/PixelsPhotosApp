//
//  PhotoCell.swift
//  PixelsPhotosApp
//
//  Created by ramil on 11.03.2021.
//

import UIKit

class PhotoCell: UITableViewCell {
    var onReuse: () -> Void = {}
    
    lazy var imageV: UIImageView = {
       let v = UIImageView()
        v.contentMode = .scaleAspectFill
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        return v
    }()
    
    lazy var photographerLabel: UILabel = {
       let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = v.font.withSize(16)
        v.textColor = .white
        return v
    }()
    
    lazy var photographerTagLabel: UILabel = {
       let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = v.font.withSize(14)
        v.textColor = .white
        return v
    }()
    
    private lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        return blurView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        [imageV, blurEffectView].forEach { v in
            contentView.addSubview(v)
        }
        [photographerLabel, photographerTagLabel].forEach { v in
            blurEffectView.contentView.addSubview(v)
        }
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageV.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageV.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageV.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            blurEffectView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blurEffectView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            blurEffectView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            photographerLabel.leadingAnchor.constraint(equalTo: blurEffectView.leadingAnchor, constant: 2),
            photographerLabel.trailingAnchor.constraint(equalTo: blurEffectView.trailingAnchor, constant: -2),
            photographerLabel.topAnchor.constraint(equalTo: blurEffectView.topAnchor, constant: 2),
            photographerTagLabel.leadingAnchor.constraint(equalTo: blurEffectView.leadingAnchor, constant: 2),
            photographerTagLabel.trailingAnchor.constraint(equalTo: blurEffectView.trailingAnchor, constant: -2),
            photographerTagLabel.topAnchor.constraint(equalTo: photographerLabel.bottomAnchor, constant: 2),
            photographerTagLabel.bottomAnchor.constraint(equalTo: blurEffectView.bottomAnchor, constant: -2)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        onReuse()
        imageV.image = nil
    }
}
