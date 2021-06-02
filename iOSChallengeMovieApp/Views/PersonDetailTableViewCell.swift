//
//  PersonDetailTableViewCell.swift
//  iOSChallengeMovieApp
//
//  Created by Muhammed Emin Aydın on 2.06.2021.
//

import UIKit

class PersonDetailTableViewCell: UITableViewCell {

    static let identifier = "PersonDetailTableViewCell"
    
    private let userImageView: UIImageView = {
          let imageView = UIImageView()
          imageView.contentMode = .scaleAspectFill
          imageView.layer.cornerRadius = 50
          imageView.layer.masksToBounds = true
          return imageView
      }()

      private let personNameLabel: UILabel = {
          let label = UILabel()
          label.font = .systemFont(ofSize: 21, weight: .semibold)
          return label
      }()

      private let characterNameLabel: UILabel = {
          let label = UILabel()
          label.font = .systemFont(ofSize: 19, weight: .regular)
          label.numberOfLines = 0
          return label
      }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(userImageView)
        contentView.addSubview(personNameLabel)
        contentView.addSubview(characterNameLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        userImageView.frame = CGRect(x: 10,
                                     y: 10,
                                     width: 100,
                                     height: 100)

        personNameLabel.frame = CGRect(x: (userImageView.frame.size.width + userImageView.frame.origin.x) + 10,
                                       y: 10,
                                       width: contentView.frame.size.width - 20 - userImageView.frame.size.width,
                                       height: (contentView.frame.size.height-20)/2)

        characterNameLabel.frame = CGRect(x: (userImageView.frame.size.width + userImageView.frame.origin.x) + 10,
                                          y: 50,
                                          width: contentView.frame.size.width - 20 - userImageView.frame.size.width,
                                          height: (contentView.frame.size.height-20)/2)
      
    }
    
    public func configure(with model: Cast) {
        
        personNameLabel.text = model.originalName
        let imageUrl = Service.getImageUrl(path: model.profilePath ?? "")
        userImageView.sd_setImage(with: URL(string: imageUrl))
        characterNameLabel.text = model.character
     
    }

}
