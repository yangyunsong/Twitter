//
//  TwitterCell.swift
//  Twitter
//
//  Created by 杨云淞 on 2017/5/21.
//  Copyright © 2017年 杨云淞. All rights reserved.
//

import LBTAComponents


class TwitterCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet{
            guard let tweet = datasourceItem as? Tweet else {return}
            
            profileImageView.loadImage(urlString: tweet.user.profileImageUrl)
            
                        
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)])
            
            let usernameString = "  \(tweet.user.username)\n"
            attributedText.append(NSAttributedString(string: usernameString, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: UIColor.gray]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.string.characters.count)
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
            
            
            attributedText .append(NSAttributedString(string: tweet.message, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]))
            
            messageTextView.attributedText = attributedText
            }
        }
    
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.text = "SOME SIMPLE TEXT"
        tv.isUserInteractionEnabled = false
        tv.backgroundColor = .clear
        return tv
    }()
    
    let profileImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()

    
    let replayButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "replay").withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    
    let retweetButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    
    let likeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()

    
    let directMessageButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()


    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(messageTextView)
        
        
        
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
         
        setButtonButtons()
        
    }
    
    fileprivate func setButtonButtons() {
        let replayButtonContainerView = UIView()
        
        let retweetButtoncontainerView = UIView()
        
        let likeButtonContainerView = UIView()

        let directMessageButtonContainerView = UIView()

        
        
        let buttonStaticView = UIStackView(arrangedSubviews: [replayButtonContainerView,retweetButtoncontainerView, likeButtonContainerView, directMessageButtonContainerView])
        
        buttonStaticView.axis = .horizontal
        buttonStaticView.distribution = .fillEqually
        
        addSubview(buttonStaticView)
        buttonStaticView.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        addSubview(replayButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(directMessageButton)
        
        replayButton.anchor(replayButtonContainerView.topAnchor, left: replayButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        retweetButton.anchor(retweetButtoncontainerView.topAnchor, left: retweetButtoncontainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        likeButton.anchor(likeButtonContainerView.topAnchor, left: likeButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        directMessageButton.anchor(directMessageButtonContainerView.topAnchor, left: directMessageButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)

        
    }
}
