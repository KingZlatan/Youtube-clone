//
//  SettingCell.swift
//  Youtube
//
//  Created by Sai206511854 on 3/13/17.
//  Copyright © 2017 Sai206511854. All rights reserved.
//

import UIKit

class SettingCell: BaseCell {
    
    let multiplier: CGFloat = 0.4
    
    let model: SettingModel = SettingModel()

    let nameLabel: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor.black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView

    }()
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.gray : UIColor.white
            image.tintColor = isHighlighted ? UIColor.white : UIColor.black
            nameLabel.textColor = isHighlighted ? UIColor.white : UIColor.black
        }
    }
    
    override var isSelected: Bool {
        didSet {
            performAction()
//            let alert = UIAlertController(title: "Alert!", message: "Selected \((nameLabel.text)!)", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        }
    }
    
    override func setUpViews() {
        super.setUpViews()
        
        addSubview(nameLabel)
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: self.frame.height+25))
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 1))

        addSubview(image)
        addConstraint(NSLayoutConstraint(item: image, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: image, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: image, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 20))
        addConstraint(NSLayoutConstraint(item: image, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))

//        image.frame = CGRect(x: 0, y: 0, width: self.frame.height, height: self.frame.height)
    }
    
    private func performAction() {
        
    }
}
