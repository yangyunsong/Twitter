//
//  HomeDatasourceController+navbar.swift
//  Twitter
//
//  Created by 杨云淞 on 2017/5/21.
//  Copyright © 2017年 杨云淞. All rights reserved.
//

import UIKit

extension HomeDatasourceController {

    func setNavigationBarItems(){
        setupRemainingNavItems()
        setupLeftNavItems()
        setupRightNavItems()
    }
    
    private func setupRemainingNavItems() {
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let navNarSeparatorView = UIView()
        navNarSeparatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        view.addSubview(navNarSeparatorView)
        
        navNarSeparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
    
    private func setupLeftNavItems() {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow@2xpng").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRightNavItems() {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton),UIBarButtonItem(customView: searchButton)]
    }
}
