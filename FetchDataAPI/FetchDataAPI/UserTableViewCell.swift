//
//  UserTableViewCell.swift
//  FetchDataAPI
//
//  Created by SongEam Sela on 8/9/20.
//  Copyright © 2020 SongEam Sela. All rights reserved.
//

import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell {
    
    
    var user: UserModel? {
        didSet {
            guard let users = user else { return }
            
            if let firstName = users.first_name, let lastName = users.last_name , let id = users.id{
                nameLabel.text = "\(id) \(firstName) \(lastName)"
            }
            if let email = users.email{
                emailLabel.text = " \(email)"
            }
            if let strUrl = users.avatar {
                let url = URL (string: strUrl)                
                self.profileImageView.kf.setImage(with: url)
                //                guard let imageURL = URL(string: url) else { return }
                //
                //                DispatchQueue.global().async {
                //                    guard let imageData = try? Data(contentsOf: imageURL) else { return }
                //
                //                    let image = UIImage(data: imageData)
                //                    DispatchQueue.main.async {
                //                        self.profileImageView.image = image
                //                    }
                //                }
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(emailLabel)
        self.contentView.addSubview(containerView)
        
        
        profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.profileImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        emailLabel.bottomAnchor.constraint(equalTo:containerView.bottomAnchor).isActive = true
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        
        return img
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    
    
    
    
    
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //        // Initialization code
    //    }
    //
    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
    //    }
    
}
