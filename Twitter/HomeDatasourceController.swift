//
//  HomeDatasourceController.swift
//  Twitter
//
//  Created by 杨云淞 on 2017/5/18.
//  Copyright © 2017年 杨云淞. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON


class HomeDatasourceController: DatasourceController {
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Apologies something went weong. Please try again later..."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview()
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setNavigationBarItems()
        
        
        
        Service.sharedInstance.fetchHomeFeed { (homeDatasource, err) in
            if let err = err {
                self.errorMessageLabel.isHidden = false
                
                if let apiError = err as? APIError<Service.JSONError> {
                    if apiError.response?.statusCode != 200{
                        self.errorMessageLabel.text = "Status code was not 200"
                    }
                }
                
                return
            }
            self.datasource = homeDatasource
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            if let user = self.datasource?.item(indexPath) as? User{
                
                let estimatedHeight = estimateHeightForText(user.bioText)

                return CGSize(width: view.frame.width, height: estimatedHeight + 66)
                
            }
        }else if indexPath.section == 1 {
            
            guard let tweet = datasource?.item(indexPath) as? Tweet else {return .zero}
            
            
            let estimatedHeight = estimateHeightForText(tweet.message)
            
            return CGSize(width: view.frame.width, height: estimatedHeight + 74)
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func estimateHeightForText(_ text: String) -> CGFloat {
        let approximatewidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
        let size =  CGSize(width: approximatewidthOfBioTextView, height: 1000)
        let attribute = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
        
        let estimatedFrame = NSString(string: text ).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attribute, context: nil)
        
        return estimatedFrame.height
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section != 0 {
            return .zero
        }
        
        return CGSize(width: view.frame.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section != 0 {
            return .zero
        }

        return CGSize(width: view.frame.width, height: 64)
    }
    
}
