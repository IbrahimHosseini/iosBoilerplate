//
//  SideItemCell.swift
//  baseproject
//
//  Created by Pazandish on 3/10/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import UIKit

class SideItemCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var dividerView: UIView!
    @IBOutlet weak var dividerTopView: UIView!
    @IBOutlet weak var titleLabel: CustomLabel!
    @IBOutlet weak var titleImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.textColor = Colors.white
        titleLabel.font = UIFont.number(ofSize: 15)
        
        bgView.backgroundColor = Colors.gray
        
        dividerView.backgroundColor = Colors.gray.withAlphaComponent(0.2)
        dividerTopView.backgroundColor = Colors.gray.withAlphaComponent(0.2)
        
    }
    
    func fill(titleLabel: String, titleImage: String, index: Int) {
        
        self.titleLabel.text = titleLabel
        self.titleImage.image = UIImage(named: titleImage)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = ""
        self.titleImage.image = nil
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
